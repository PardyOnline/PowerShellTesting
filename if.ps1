If ($this -eq $that) {
    # Commands
} elseif ($those -eq $them) {
    # Commands 
} elseif($we -gt $they) {
    # Commands
} else {
    # Commands
}

$Status=(Get-Service -Name BITS).Status
If($Status -eq "Running") {
    Clear-Host
    Write-Output "Service is being stopped"
    Stop-Service -name BITS
} else { 
    Clear-Host
    Write-Output "Service is already stopped"
}