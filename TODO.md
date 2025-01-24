# add comma to money textdraw
```pawn
#include <a_samp>

forward FormatNumber(buffer[], number);

main() {
    // Initialization
}

public OnPlayerCommandText(playerid, cmdtext[]) {
    if (strcmp("/mymoney", cmdtext, true, 10) == 0) {
        new money;
        GetPlayerMoney(playerid, money);

        new formattedMoney[24];
        FormatNumber(formattedMoney, money);

        new message[48];
        format(message, sizeof(message), "Your money: %s$", formattedMoney);
        SendClientMessage(playerid, -1, message);

        return 1;
    }
    return 0;
}

forward FormatNumber(buffer[], number) {
    new count = 0, length = 0, tempnum = number;
    
    // Get number of digits
    while (tempnum > 0) {
        tempnum /= 10;
        length++;
    }

    // Add commas to the number
    for (new i = length - 1; i >= 0; i--) {
        buffer[i + count] = (number % 10) + '0';
        number /= 10;

        if (i > 0 && (length - i) % 3 == 0) {
            buffer[i + (--count)] = ',';
        }
    }

    buffer[length + count] = '\0';
}


```