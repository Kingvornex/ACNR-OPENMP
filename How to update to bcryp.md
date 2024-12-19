Sure thing! I can help you update your code to use bcrypt for hashing and verifying passwords. Here’s a step-by-step guide to transition from Whirlpool to bcrypt in your SA:MP gamemode:

### 1. Hashing Passwords with bcrypt

First, you'll need to replace your existing password hashing code with bcrypt. Here’s how you can do it:

```pawn
new buf[129];
// Hashing the password
bcrypt_hash(playerid, "OnPasswordHash", inputtext, BCRYPT_COST);

// Callback function to handle the result of hashing
forward OnPasswordHash(playerid);
public OnPasswordHash(playerid) {
    new dest[BCRYPT_HASH_LENGTH];
    bcrypt_get_hash(dest);
    PlayerInfo[playerid][pPass] = dest;

    // Save the hashed password in INI file
    new f[40];
    format(f, sizeof(f), USER_FILE, GetName(playerid));
    new INI:ufile = INI_Open(f);
    INI_WriteString(ufile, "pPass", PlayerInfo[playerid][pPass]);
    INI_Close(ufile);

    format(fstr, sizeof(fstr), "New password %s set.", inputtext);
    SendClientMessage(playerid, WHITE, fstr);
}
```

### 2. Verifying Passwords with bcrypt

You’ll need to update the password verification code as well:

```pawn
// Verifying the password
bcrypt_hash(playerid, "OnPasswordVerify", inputtext, BCRYPT_COST);

// Callback function to handle the result of verification
forward OnPasswordVerify(playerid, bool:success);
public OnPasswordVerify(playerid, bool:success) {
    if (success) {
        // Password is correct
        IsPlayersFirstSpawn[playerid] = false;
        IsLoggedIn[playerid] = 1;
        ShowPlayerDialog(playerid, CONTROL_PANEL2, DIALOG_STYLE_INPUT, "{FFFFFF}Player Control Panel", "{FFFFFF}Please enter your new password below:", "Select", "Cancel");
    } else {
        // Password is incorrect
        SendClientMessage(playerid, RED, "Invalid password.");
        KickPlayer(playerid);
    }
}
```

### 3. Adjust Thread Limits (Optional)

To manage the number of worker threads for bcrypt, you can set the thread limit:

```pawn
bcrypt_set_thread_limit(3);
```

This is a basic guide to get you started with bcrypt in your SA:MP gamemode. Make sure to test your implementation thoroughly to ensure it works as expected. Let me know if you need any further assistance!
