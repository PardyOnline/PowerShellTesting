# Find a service that is stopped to test every part of script
#Get-Service | Where-Object {$_.Status -eq "Stopped"}
# Get-Service | Where-Object {$_.Status -eq "Running"}

# Create a variable to store the service name thats running
# $SName = 'EventLog'

# Create a variable to store the service name thats running
# $SName = 'BITS'

# Stop service for testing purposes
Stop-Service -Name $SName

#Read the service from Windows to return a service object
$SInfo = Get-Service -Name $SName

# If service is not running (ne - not equal)
if ($SInfo.Status -ne 'Running') {
    # Tell console that the service is not running
    Write-Host 'Service is not online.' 
    Write-Host 'Starting Service now'

    # Start the service
    Start-Service -Name $SName

    # Update the Sname object to show new state os service
    $SInfo.Refresh()

    # Tell console the new state of the service
    Write-Host $SInfo.Status
} else { # If status is anything but running
    # Tell console service is already running
    Write-Host 'Service Online'
}