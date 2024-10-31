
# Windows 10 notes 

## Managing files  

### List 10 largest files for C:\ in megabytes

`Get-ChildItem c:\ -r -ErrorAction SilentlyContinue –Force |sort -descending -property length | select -first 10 name, DirectoryName, @{Name="MB";Expression={[Math]::round($_.length / 1MB, 2)}}`


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

    
> The $PROFILE variable is a variable that contains the path to your windows "profile".ps1 , it can be named anything 
> but this is where you would keep all your custom configurations. In my case the variable contains the path of : 
> `C:\Users\username\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

