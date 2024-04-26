# Service Example

```c
#include <stdio.h>
#include <string.h>

#define MAX_LENGTH 100

int main() {
    char input[MAX_LENGTH];

    printf("Enter a command (type 'exit' to quit):\n");

    while (1) {
        printf("> ");
        fgets(input, sizeof(input), stdin);

        // Remove trailing newline character
        input[strcspn(input, "\n")] = 0;

        if (strcmp(input, "exit") == 0) {
            printf("Exiting program...\n");
            break;
        }

        printf("You entered: %s\n", input);
    }

    return 0;
}
```

This program creates a loop that waits for user input from the command line. It prints a prompt (`>`) and then reads a line of input using `fgets()`. It compares the input string with "exit" to determine if the user wants to quit the program. If not, it simply echoes back what the user entered.

### Create the service

First, compile your C program. Assuming your program is named `cli_listener.c`, you can compile it using the following command:

```bash
gcc -o cli_listener cli_listener.c
```

Now, create a systemd service file for your program. Open a text editor and create a file named `cli_listener.service` with the following contents:

```
[Unit]
Description=CLI Listener Service
After=network.target

[Service]
Type=simple
ExecStart=/path/to/your/cli_listener

[Install]
WantedBy=multi-user.target
```

Replace `/path/to/your/cli_listener` with the actual path to your compiled C program.

Once you've created the service file, move it to the systemd service directory:

```bash
sudo mv cli_listener.service /etc/systemd/system/
```

Now, reload systemd to read the new service file:

```bash
sudo systemctl daemon-reload
```

You can now start your service:

```bash
sudo systemctl start cli_listener
```

And enable it to start at boot:

```bash
sudo systemctl enable cli_listener
```

That's it! Your C program should now be running as a systemd service on your Debian system. You can check its status with:

```bash
sudo systemctl status cli_listener
```

And stop it with:

```bash
sudo systemctl stop cli_listener
```

Or disable it from starting at boot with:

```bash
sudo systemctl disable cli_listener
```
