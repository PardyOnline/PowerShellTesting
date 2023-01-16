# Using the param block
function t{

    [CmdletBinding()]
    param(
        [String]$ComputerName=(hostname),
        [String]$Drive='C:'
    )

    Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName
}