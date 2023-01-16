# Create Function
Function Get-DiskInfo {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [String]$ComputerName,
        [String]$Drive='C:'
    )
    Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='C:'" -ComputerName 'Localhost' | 
        Select PSComputerName, DeviceID,
            @{n='Size(GB)';e={$_.size / 1gb -as [int]}},
            @{n='Free(GB)';e={$_.Freespace / 1gb -as [int]}}
}