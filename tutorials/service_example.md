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
chmod +x /etc/init.d/cli_listener
```
Sure, if you want to create a Linux service in Ubuntu without using systemd, you can use traditional SysVinit scripts. Here's how you can do it:

1. **Write Your C Program**: First, write your C program. Let's assume your C program is named `cli_listener.c`.

2. **Compile Your C Program**: Compile your C program into an executable. Assuming your executable is named `cli_listener`, you can compile it using `gcc`:

    ```bash
    gcc -o cli_listener cli_listener.c
    ```

3. **Create a SysVinit Script**: Now, you'll create a SysVinit script to manage your service. Create a new file named `cli_listener` in the `/etc/init.d/` directory:

    ```bash
    sudo nano /etc/init.d/cli_listener
    ```

    Add the following content to the script:

    ```bash
    #!/bin/sh
    ### BEGIN INIT INFO
    # Provides:          cli_listener
    # Required-Start:    $all
    # Required-Stop:     $all
    # Default-Start:     2 3 4 5
    # Default-Stop:      0 1 6
    # Short-Description: CLI Listener Service
    ### END INIT INFO

    # Change the working directory to where your executable is located
    cd /var/www/html/Services/cli_listener

    case "$1" in
        start)
            echo "Starting CLI Listener Service"
            ./cli_listener &
            ;;
        stop)
            echo "Stopping CLI Listener Service"
            pkill -f cli_listener
            ;;
        restart)
            echo "Restarting CLI Listener Service"
            pkill -f cli_listener
            sleep 1
            ./cli_listener &
            ;;
        *)
            echo "Usage: $0 {start|stop|restart}"
            exit 1
            ;;
    esac

    exit 0
    ```

    Make sure to replace `/var/www/html/Services/cli_listener` with the actual directory where your compiled executable `cli_listener` is located.

4. **Set Executable Permissions**: Make the script executable:

    ```bash
    sudo chmod +x /etc/init.d/cli_listener
    ```

5. **Register the Service**: Register the service to start automatically at boot:

    ```bash
    sudo update-rc.d cli_listener defaults
    ```

6. **Start the Service**: You can start, stop, and restart the service using the `service` command:

    ```bash
    sudo service cli_listener start
    ```

    ```bash
    sudo service cli_listener stop
    ```

    ```bash
    sudo service cli_listener restart
    ```

That's it! Your C program should now be running as a service in Ubuntu using the SysVinit approach. This method is a bit more manual compared to systemd, but it's still widely used, especially on older systems or in cases where systemd is not available.
