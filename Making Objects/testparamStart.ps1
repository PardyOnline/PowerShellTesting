Function Get-CompInfo {
    [CmdletBinding()]
    Param(
        # Want to support multiple computers
        [String[]]$ComputerName,
        # Switch to use Error logging
        [Switch]$ErrorLog,
        [String]$LogFile = 'C:\errors.txt'
    )
    Begin{}
    Process{}
    End{}
}