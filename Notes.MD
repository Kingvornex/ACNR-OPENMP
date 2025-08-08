
# 1) Ferris wheel — validate dynamic objects & stabilize rotation

**Problem**
Code rotates wheel objects every tick but does not check `CreateDynamicObject` results, doesn't check `IsValidDynamicObject` before calling `MoveDynamicObject`, and may rotate at an accumulating floating point angle that grows unbounded.

**Fix (paste into your ferris wheel script — replace the relevant function bodies)**

```pawn
// --- Safe creation & rotation for Ferris Wheel ---
// Ensure you include/declare IsValidDynamicObject if not present

new Float:wheelRot = 0.0;
new wheelObjectId = -1;

// Call this once on startup to create the wheel object safely
public CreateFerrisWheel(Float:x, Float:y, Float:z, modelid)
{
    if (wheelObjectId != -1) {
        // already created; destroy and recreate if you want
        if (IsValidDynamicObject(wheelObjectId)) DestroyDynamicObject(wheelObjectId);
        wheelObjectId = -1;
    }

    wheelObjectId = CreateDynamicObject(modelid, x, y, z, 0.0, 0.0, 0.0, 100, 0);
    if (wheelObjectId == INVALID_OBJECT_ID || wheelObjectId < 0) {
        // log the error — object creation failed
        printf("[FerrisWheel] CreateDynamicObject failed (model %d) at %.2f,%.2f,%.2f", modelid, x, y, z);
        wheelObjectId = -1;
        return 0; // failure
    }
    return 1; // success
}

// Called on a timer (e.g., every 50ms)
public UpdateFerrisWheelRotation()
{
    if (wheelObjectId == -1) return;
    if (!IsValidDynamicObject(wheelObjectId)) {
        // object lost — attempt recreate or log
        printf("[FerrisWheel] object invalid, attempting recreate");
        CreateFerrisWheel(/* pass initial pos & model */);
        return;
    }

    // rotate smoothly; keep angle within -180..180 to avoid float runaway
    wheelRot += 2.0; // degrees per tick — tune as needed
    if (wheelRot >= 360.0) wheelRot -= 360.0;
    while (wheelRot > 180.0) wheelRot -= 360.0;
    while (wheelRot < -180.0) wheelRot += 360.0;

    // MoveDynamicObject expects Float params for pos & rot; use the appropriate API call
    MoveDynamicObject(wheelObjectId, /*x*/ 0.0, /*y*/0.0, /*z*/0.0, /*rx*/0.0, /*ry*/wheelRot, /*rz*/0.0, 100, 0);
}
```

**Why this fixes it**

* Checks `CreateDynamicObject` return and logs on failure.
* Uses `IsValidDynamicObject` before moving.
* Keeps rotation angle bounded, preventing runaway floats and eliminates repeated large increases that could cause odd behavior.

---

# 2) Pirate Ship — validate object creation & handle failures

**Problem**
Dynamic objects (e.g., sails, hull parts) are created but returned ID not validated before later usage; crash risk if object creation fails.

**Fix (pattern to apply for any object create code)**

```pawn
new g_pirateObjects[MAX_PIRATE_PARTS]; // initialize to -1

public CreatePirateShipParts()
{
    for (new i = 0; i < MAX_PIRATE_PARTS; i++) {
        g_pirateObjects[i] = CreateDynamicObject(partModel[i], partX[i], partY[i], partZ[i], 0.0,0.0,0.0,100,0);
        if (g_pirateObjects[i] == INVALID_OBJECT_ID || g_pirateObjects[i] < 0) {
            printf("[PirateShip] failed to create part %d (model %d). Cleaning up created parts.", i, partModel[i]);
            // Clean up any previously created parts
            for (new j = 0; j < i; j++) {
                if (g_pirateObjects[j] != -1 && IsValidDynamicObject(g_pirateObjects[j])) {
                    DestroyDynamicObject(g_pirateObjects[j]);
                    g_pirateObjects[j] = -1;
                }
            }
            return 0;
        }
    }
    return 1;
}

public DestroyPirateShipParts()
{
    for (new i = 0; i < MAX_PIRATE_PARTS; i++) {
        if (g_pirateObjects[i] != -1 && IsValidDynamicObject(g_pirateObjects[i])) {
            DestroyDynamicObject(g_pirateObjects[i]);
            g_pirateObjects[i] = -1;
        } else {
            g_pirateObjects[i] = -1;
        }
    }
}
```

**Why this fixes it**

* Ensures objects are destroyed on partial failure to avoid dangling resources.
* Prevents later code from using invalid object IDs.

---

# 3) Basketball — prevent multiple players holding the ball & add ID checks

**Problem**
Edge cases let multiple players become “ball holder”; also calls that destroy or move objects without validating dynamic object or player IDs.

**Fix (core patterns — adapt to your actual function names)**

```pawn
// Globals
new BallObject = -1;
new BallHolder = INVALID_PLAYER_ID;

// Acquire ball command (player tries to pick ball)
public command_getball(playerid)
{
    if (!IsPlayerConnected(playerid)) return 0;
    // if ball is already held, deny
    if (BallHolder != INVALID_PLAYER_ID && IsPlayerConnected(BallHolder)) {
        SendClientMessage(playerid, 0xFF0000AA, "Ball is already held by someone.");
        return 1;
    }

    // perform possession transfer
    if (BallHolder != INVALID_PLAYER_ID && !IsPlayerConnected(BallHolder)) {
        BallHolder = INVALID_PLAYER_ID; // previous holder disconnected
    }

    // assign holder atomically
    BallHolder = playerid;
    // attach ball object to the player, validate object id
    if (BallObject == -1 || !IsValidDynamicObject(BallObject)) {
        // create the ball
        BallObject = CreateDynamicObject(14827, playerX, playerY, playerZ+1.0, 0.0, 0.0, 0.0, 100, 0);
        if (BallObject < 0) {
            SendClientMessage(playerid, 0xFF0000AA, "Failed to create ball object.");
            BallHolder = INVALID_PLAYER_ID;
            return 1;
        }
    }
    // attach or move the object to player (if you use MoveDynamicObject or AttachDynamicObjectToPlayer)
    AttachDynamicObjectToPlayer(BallObject, playerid, 0, 0, 0, 0, 0, 0); // example call — adapt parameters
    return 1;
}

// OnBallThrow or OnPlayerDisconnect
public OnPlayerDisconnect(playerid, reason)
{
    if (BallHolder == playerid) {
        // drop ball: detach & reset holder
        if (BallObject != -1 && IsValidDynamicObject(BallObject)) {
            DetachDynamicObject(BallObject); // use correct API
            // optional: set ball position at player's last pos
        }
        BallHolder = INVALID_PLAYER_ID;
    }
}
```

**Why this fixes it**

* Ensures only one `BallHolder` allowed.
* Checks `IsPlayerConnected` before assigning or referencing player IDs.
* Validates object creation and destroys/cleans up on disconnect.

---

# 4) FilterScript (vehicle spam) — rate limiting & spawn cap

**Problem**
Filter script spawns many vehicles in one tick and exceeds server creation limit.

**Fix — introduce per-spawn timer, queue and global cap**

```pawn
#define MAX_SPAWN_PER_TICK 3
new SpawnQueueX[MAX_QUEUE];
new SpawnQueueY[MAX_QUEUE];
new SpawnQueueZ[MAX_QUEUE];
new SpawnQueueModel[MAX_QUEUE];
new spawnQueueHead = 0, spawnQueueTail = 0;
new currentPendingSpawns = 0;
#define MAX_ACTIVE_FILTER_VEHICLES 100

public EnqueueVehicle(modelid, Float:x, Float:y, Float:z)
{
    if ((spawnQueueTail+1) % MAX_QUEUE == spawnQueueHead) {
        // queue full; drop or log
        return 0;
    }
    SpawnQueueModel[spawnQueueTail] = modelid;
    SpawnQueueX[spawnQueueTail] = x;
    SpawnQueueY[spawnQueueTail] = y;
    SpawnQueueZ[spawnQueueTail] = z;
    spawnQueueTail = (spawnQueueTail + 1) % MAX_QUEUE;
    return 1;
}

// timer every 1000ms (1s) or less
public ProcessVehicleSpawnQueue()
{
    new spawnedThisTick = 0;
    while (spawnedThisTick < MAX_SPAWN_PER_TICK && spawnQueueHead != spawnQueueTail) {
        if (currentPendingSpawns >= MAX_ACTIVE_FILTER_VEHICLES) {
            // reached cap — stop spawning
            break;
        }
        new model = SpawnQueueModel[spawnQueueHead];
        new Float:x = SpawnQueueX[spawnQueueHead];
        new Float:y = SpawnQueueY[spawnQueueHead];
        new Float:z = SpawnQueueZ[spawnQueueHead];
        spawnQueueHead = (spawnQueueHead + 1) % MAX_QUEUE;

        new vehid = CreateDynamicVehicle(model, x, y, z, 0.0, 0.0, 0.0); // adapt API
        if (vehid >= 0) {
            currentPendingSpawns++;
            spawnedThisTick++;
            // store the vehid somewhere to manage later and decrement currentPendingSpawns when destroyed
        } else {
            // creation failed — log and continue
            printf("[FilterScript] Create vehicle failed for model %d at %.2f,%.2f,%.2f", model, x, y, z);
        }
    }
}
```

**Why this fixes it**

* Limits how many vehicles spawn per tick (prevents sudden burst).
* Sets a global cap so you never hit server absolute limits.
* Queues spawns to be processed over time.

---

# 5) General guidelines & small code hygiene changes

* **Always check `IsPlayerConnected(playerid)`** before using player state, sending messages, reading coordinates, etc.
* **Check returns of `CreateDynamicObject`, `CreateDynamicVehicle`, `CreatePlayerObject` etc** — treat negative or `INVALID_OBJECT_ID` as failure.
* **Use `IsValidDynamicObject(objid)`** before moving/destroying the object.
* **Avoid disabling warnings blindly**; prefer fixing the root cause (unused variables, shadowing, tag mismatches).
* **Replace magic numbers** with named constants (you’ll find 'ball model 14827' or similar — move it to `#define BALL_MODEL 14827`).
* **Add defensive cleanup on player disconnects** — detach/destroy objects, clear `BallHolder`, decrement spawn counters.

---

# How to apply / test locally

1. **Fetch the repo locally**:
   `git clone https://github.com/Kingvornex/ACNR-OPENMP.git`
   `cd ACNR-OPENMP`

2. **Find functions to modify**:
   Search for `CreateDynamicObject`, `MoveDynamicObject`, `CreateDynamicVehicle`, and the string `FerrisWheel` / `pirate` / `basketball` in your `gamemodes` and `filterscripts` folders.

3. **Apply the snippets**:
   Replace the relevant code with the provided patterns. If you prefer, I can produce small diffs/patch files for each change (just tell me which file(s) to target).

4. **Compile** with your Pawn/Open.MP toolchain (sampctl / pawn compiler). Resolve any minor symbol name differences (APIs vary slightly by includes) — the logic remains.

5. **Run a test server** (locally or dev) and exercise:

   * Spawn/stop the ferris wheel multiple times.
   * Spawn pirate ship (simulate partial failure).
   * Try the basketball edge cases: two players grabbing same ball, disconnecting holder.
   * Let filterscript attempt to spawn many vehicles; verify the cap and queue work.

6. **Check logs** for the `printf` diagnostic messages I added to catch failures.

---
