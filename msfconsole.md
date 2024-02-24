# Metasploit Framework Console (msfconsole) Commands Cheat Sheet

## General Commands

- **`help`**: Display help information.
  
- **`banner`**: Display the Metasploit banner.
  
- **`exit` or `quit`**: Exit the Metasploit console.
  
- **`clear`**: Clear the console screen.
  
- **`version`**: Display the Metasploit Framework version.

## Module Management

- **`search`**: Search for modules by name or description.
  
- **`use`**: Select a module for use.
  
- **`info`**: Display information about a selected module.
  
- **`options`**: Display options for the selected module.
  
- **`show payloads`**: List available payloads for the selected exploit.

## Exploitation

- **`set`**: Set options for the selected module.
  
- **`unset`**: Unset options for the selected module.
  
- **`check`**: Check if a target is vulnerable.
  
- **`exploit`**: Launch the selected exploit.
  
- **`run`**: Same as `exploit`, launches the selected exploit.

## Post-Exploitation

- **`sessions`**: List active sessions.
  
- **`sessions -i <session_id>`**: Interact with a specific session.
  
- **`background`**: Background the current session.

## Payload Generation

- **`generate`**: Generate a payload.
  
- **`use exploit/multi/handler`**: Set up a multi-handler to receive payloads.

## Database Interaction

- **`db_connect`**: Connect to a database.
  
- **`db_status`**: Display the status of the connected database.
  
- **`db_hosts`**: List hosts in the database.
  
- **`db_services`**: List services in the database.
  
- **`db_vulns`**: List vulnerabilities in the database.

## Miscellaneous

- **`creds`**: Manage credentials in the database.
  
- **`reload_all`**: Reload all modules from disk.
  
- **`sleep`**: Set the delay between modules' actions.

## Resource Scripting

- **`resource`**: Load and execute a resource script.

These commands provide a starting point for interacting with the Metasploit Framework console (msfconsole). Experimenting with these commands will help you become more familiar with Metasploit's capabilities for penetration testing and exploitation. Always ensure you have proper authorization before using Metasploit or any other hacking tool.
