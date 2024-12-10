; AutoHotkey script to send clipboard text when PgDn is pressed
PgDn::
{
    ; Wait for the clipboard to contain data
    ClipWait, 1
    if (ErrorLevel) {
        ; Do nothing if the clipboard is empty or an error occurred
        return
    } else {
        Send, %clipboard% ; Send the clipboard contents as keystrokes
    }
}
