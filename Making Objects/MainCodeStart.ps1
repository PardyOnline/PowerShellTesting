Function Get-CompInfo {
    [CmdletBinding()]
    Param(
        # Want to support multiple computers
        [String[]]$ComputerName,
        # Switch to use Error logging
        [Switch]$ErrorLog,
        [String]$LogFile = 'C:\errors.txt'
    )
    Begin{
        If($errorLog) {
            Write-Verbose 'Error Logging Enabled'
        } Else { 
            Write-Verbose 'Error Logging Disabled'
        }
        ForEach($c in $ComputerName) {
            Write-Verbose "Computer: $C"
        }
    }
    Process{
        foreach($c in $ComputerName) {
            Get-WmiObject -ComputerName $c -CLass Win32_OperatingSystem
            Get-WmiObject -ComputerName $c -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
            }   
         }
    End{}
}