# directly from Nora-Ballard's gist at: https://gist.github.com/Nora-Ballard/11240204
function Set-WindowState {
param(
    [Parameter()]
    [ValidateSet('FORCEMINIMIZE', 'HIDE', 'MAXIMIZE', 'MINIMIZE', 'RESTORE',
                 'SHOW', 'SHOWDEFAULT', 'SHOWMAXIMIZED', 'SHOWMINIMIZED',
                 'SHOWMINNOACTIVE', 'SHOWNA', 'SHOWNOACTIVATE', 'SHOWNORMAL')]
    [Alias('Style')]
    [String] $State = 'SHOW',

    [Parameter(ValueFromPipelineByPropertyname='True')]
    [System.IntPtr] $MainWindowHandle = (Get-Process –id $pid).MainWindowHandle,

    [Parameter()]
    [switch] $PassThru

)
BEGIN
{

$WindowStates = @{
    'FORCEMINIMIZE'   = 11
    'HIDE'            = 0
    'MAXIMIZE'        = 3
    'MINIMIZE'        = 6
    'RESTORE'         = 9
    'SHOW'            = 5
    'SHOWDEFAULT'     = 10
    'SHOWMAXIMIZED'   = 3
    'SHOWMINIMIZED'   = 2
    'SHOWMINNOACTIVE' = 7
    'SHOWNA'          = 8
    'SHOWNOACTIVATE'  = 4
    'SHOWNORMAL'      = 1
}

$Win32ShowWindowAsync = Add-Type –memberDefinition @”
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
“@ -name “Win32ShowWindowAsync” -namespace Win32Functions –passThru

}
PROCESS
{
    $Win32ShowWindowAsync::ShowWindowAsync($MainWindowHandle, $WindowStates[$State]) | Out-Null
    Write-Verbose ("Set Window State on '{0}' to '{1}' " -f $MainWindowHandle, $State)

    if ($PassThru)
    {
        Write-Output $MainWindowHandle
    }

}
END
{
}

}

Set-Alias -Name 'Set-WindowStyle' -Value 'Set-WindowState'
