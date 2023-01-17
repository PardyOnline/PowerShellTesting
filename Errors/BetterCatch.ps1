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
       # If($errorLog) {
        #    Write-Verbose 'Error Logging Enabled'
        #} Else { 
          #  Write-Verbose 'Error Logging Disabled'
        #}
        #ForEach($c in $ComputerName) {
        #    Write-Verbose "Computer: $C"
        #}
    }
    Process{
        foreach($c in $ComputerName) {
                Try {
                $os=Get-WmiObject -ComputerName $c -Class Win32_OperatingSystem -ErrorAction Stop -ErrorVariable CurrentError
                $Disk=Get-WmiObject -ComputerName $c -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
                $Bios=Get-WmiObject -ComputerName $c -Class Win32_bios 

                $Prop=[ordered]@{
                    'ComputerName'=$c
                    'OS Name'=$os.caption
                    'OS Build'=$os.buildnumber
                    'FreeSpace'=$Disk.freespace / 1gb -as [int]
                    'Bios Version'=$Bios.Version
                }
                $obj=New-Object -TypeName PSObject -Property $Prop
                Write-Output $obj
            } 
            Catch {
                Write-Warning "You messed up with computer $c"
                If ($ErrorLog) {
                    Get-Date | Out-File $LogFile -Force
                    $c | out-file $LogFile -Append
                    $currentError | Out-File $LogFile -Append
                }
            }
        }
    }    
    End{} 
}