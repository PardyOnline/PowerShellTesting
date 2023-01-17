Function Get-CompInfo {
    [CmdletBinding()]
    Param(
        # Want to support multiple computers
        [Parameter(Mandatory=$True,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true,
                    HelpMessage = 'Insert computer name, or "localhost" if you dont know it.')]
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
            $os=Get-WmiObject -ComputerName $c -Class Win32_OperatingSystem
            $Disk=Get-WmiObject -ComputerName $c -Class Win32_LogicalDisk -Filter "DeviceID='C:'"

            $Prop=[ordered]@{
                'ComputerName'=$c
                'OS Name'=$os.caption
                'OS Build'=$os.buildnumber
                'FreeSpace'=$Disk.freespace / 1gb -as [int]
            }
        }
        # This prodcues an object
        $obj=New-Object -TypeName PSObject -Property $Prop
        Write-Output $obj
         }
    End{}
}