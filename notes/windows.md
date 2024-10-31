
# Windows 10 notes **WORK IN PROGRESS**

## Managing files  

- List 10 largest files for C:\ in megabytes
    ```bash
    Get-ChildItem c:\ -r -ErrorAction SilentlyContinue –Force |sort -descending -property length | select -first 10 name, DirectoryName, @{Name="MB";Expression={[Math]::round($_.length / 1MB, 2)}}
    ```


## Environment Variables 

The commands below are used to modify existing Environment Variables.

### Command Snippets 

- List Environment Variables 
    ```bash
    Get-Childitem env: 
    ```

- Permanantly append Variable to path 
    ```bash 
    setx MyVariable "MyPersistentValue" 
    ```

- Add new path to system Path 
    ```bash
    $newPath = "$env:Path;C:\NewPath"
    setx Path $newPath
    ```

- Remove temporary Environment Variable from path 
    ```bash
    Remove-Item env:MyVariable
    ```

- Remove persistent Environment Variable from path 
    ```bash
    setx MyVariable ""
    ```

- Check if Environment Variable exists in a powershell script 
    ```bash 
    if($env:MyVariable) {
        Write-Output "MyVariable exists with value $env:MyVariable"
    }else { 
        Write-Output "MyVariable does not exist"
    }
    ```

- Using an Environment Variable in a Script 
    ```bash 
    $env:MyVariable = "something"
    Write-Output "The value of MyVariable is : $env:MyVariable"
    ```
- Add script to PATH temporarily to Current Session  
    ```bash
    $env:PATH += ";C:\path\to\your\script"
    ```

- Add script to users persistent PATH  
    ```bash
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";C:\path\to\script", [System.EnvironmentVariableTarget]::User)
    ```

- List current path 
    ```bash 
    echo $env:path 
    ```

- Temporarily append Variable to path 
    ```bash
    $env:path += ";C:\Program Files\GnuWin32\bin" 
    ```

---

## Powershell configuration 

- Change Keybinds to Bash like keybinds 
    
    1. Check if `$PROFILE` variable exists 
        ```bash
        echo $PROFILE
        ```
    
    2. Open file in path listed in `echo $PROFILE`, in this case i'm using Vim but you can use any editor you like  
        ```bash
        vim $PROFILE
        ```

    3. Then , paste the following code into the file 
        ```bash
        # Load PSReadLine (should already be loaded in most cases)
        Import-Module PSReadLine

        # Map Bash-like key bindings
        Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine       # Move to start of line
        Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine             # Move to end of line
        Set-PSReadLineKeyHandler -Chord Ctrl+k -Function KillLine              # Delete text from cursor to end of line
        Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardDeleteLine    # Delete text from cursor to beginning of line
        Set-PSReadLineKeyHandler -Chord Ctrl+w -Function BackwardKillWord      # Delete previous word
        Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Yank                  # Paste the last cut text
        Set-PSReadLineKeyHandler -Chord Ctrl+l -Function ClearScreen           # Clear screen
        ```

    4. Now, save the file and reload profile.
        ```bash
        . $PROFILE
        ```

        If you receive an error like below : 

        ```
        . : File C:\Users\username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 cannot be loaded because running scripts
        is disabled on this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/fwlink/?LinkID=135170.
        At line:1 char:3
        ```

        - **Follow the instructions under "Troubleshooting" using the link here :** [ERROR:cannot be loaded because running scripts
        is disabled on this system.](#disabled-running-scripts)
        
        
    
> The $PROFILE variable is a variable that contains the path to your windows "profile".ps1 , it can be named anything 
> but this is where you would keep all your custom configurations. In my case the variable contains the path of : 
> `C:\Users\username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

---

## Troubleshooting 


### Disabled Running Scripts

This error indicates the user does not have the execution policy set for a specific user to run scripts inside their session. To allow the user to run the spcified command / script. Follow the instructions below, **make sure you're logged in as administrator**.


- Change Execution Policy to allow Local scripts
   ```bash
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

- Change Execution policy to allow user to run scripts from the internet 

    ```bash
    Set-ExecutionPolicy Unrestricted -Scope CurrentUser
    ```
- Bypass prompts for Internet Scripts
    ```bash
    Set-ExecutionPolicy Bypass -Scope CurrentUser
    ```
    

> The 'RemoteSigned' policy allows scripts created on the local machine to run , while blocking scripts from the internet unless they are signed by a trusted source. 
> The 'CurrentUser' scope only applies for the currently logged in user account , not the entire system
> Even when the Scope is set to 'Unrestricted' , you will still be prompted 
> 
