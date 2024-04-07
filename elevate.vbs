Set Shell = CreateObject("Shell.Application")
Set WShell = WScript.CreateObject("WScript.Shell")
Set ProcEnv = WShell.Environment("PROCESS")

cmd = ProcEnv("CMD")
app = ProcEnv("APP")
args = Right(cmd, (Len(cmd) - Len(app)))

If (WScript.Arguments.Count >= 1) Then
    ' Check if the argument is "switch-node"
    If (WScript.Arguments(0) = "switch-node") Then
        ' Specify the Node.js version to switch to
        nodeVersion = "14.21.3"  ' Change this to the desired Node.js version

        ' Build the NVM command to switch Node.js versions
        nvmCmd = "nvm use " & nodeVersion

        ' Execute the NVM command with elevated privileges
        Shell.ShellExecute "cmd.exe", "/c " & nvmCmd, "", "runas", 0
    Else
        ' If the argument is not "switch-node", execute the specified command with elevated privileges
        Shell.ShellExecute app, args, "", "runas", 0
    End If
Else
    WScript.Quit
End If
