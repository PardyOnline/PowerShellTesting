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

## Signs a file
param([string] $file=$(throw "Please specify a filename."))
$cert = @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
Set-AuthenticodeSignature $file $cert
# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUaJA8k1FflxzxMzyd5s5oD+8W
# M2KgggMiMIIDHjCCAgagAwIBAgIQOUV7bfS8rLJLAzJolUZxMjANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MB4X
# DTIzMDExMjEzNTQ0MFoXDTI0MDExMjE0MTQ0MFowJzElMCMGA1UEAwwcUG93ZXJT
# aGVsbCBDb2RlIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBAOt22LN7ut3CIZ1Phx6SnwXYt+qwukiWC71CE1wj/aYIIkj9N+BcNHpG
# lt5t3JknWehWdlCM0ZE0UODV8NZPy4TGG5Pj2oxG/ySFUImyI7sdP7Dey8qDeSDQ
# k0JoGmGs55RXEe2ArOlj96PAMg2G8mvzBxD3EtkcOlAWe6mVRIkRNcvyeg1npp8u
# J25VluMDE3++bykVGTzHbsj1eDJVKQmYC0FkGpE/D7WfxiszI12XboQzcOuKGnq8
# xWfiF5aaMajHDzwiEol906KKNpdt4S5fl34TdvsF3NMQmOHrs37yVHYHqeVGe6S+
# cb8Hsez2wNGiEntZkKkrv7KT8VoLByUCAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBThfyWHR+IfZ+KZP/1kX52b
# /YZsKjANBgkqhkiG9w0BAQsFAAOCAQEAmPQViwpTvE/PtLbO2RLuHfVh+RRSt86i
# HgHBycE1sXXewrJwkatyB2N8U7hvGYyojvWOFFgIKXMr+j2pb4QQiElzqUCS6kfx
# gFA4ghqpngKO3lxDipRl3zSHQ8gXecoSlydc2wBm7oUf68IDY6TTMBEI/6sz25L1
# jR/qxjCgcvxQZLzqvCCfxFcPpF0xSxfXfTaPSBNJ2H1Qh1YOTAZ+ghv40HDKIdAG
# csxC8gbIA9oXBS2g07xXmeH5CoWAdJSQNjt51OQ9NgWJUf9xHf32MrU2CiN4r37H
# yfvoIKjYiF+FLuAK9yLWESuY7JklmSvhMnZSAKKpjj+uh6m9tzMiVTGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcUG93ZXJTaGVsbCBDb2RlIFNpZ25pbmcgQ2VydAIQ
# OUV7bfS8rLJLAzJolUZxMjAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUwpd/al14+AXi70DZnBwQ
# PMwaIUswDQYJKoZIhvcNAQEBBQAEggEARSjkpC3J5VOxKzG0+FuT8IYh0J07lMc0
# Id6fNlHZJC7Dnr2Vqi8WgiyxG8T03oJNuOd/EZQ5WuaLd4PRzHW4v7p8nWyZZNgA
# 672eIi/KqChJmU6WhQZVd/rYIuGHruf3OzxGsGT1bLFFPfqNrTyuPwLmdubMaxLx
# a/P5wDebgqwa/AFTrUr9STO7+2vP0FOokH/6nojatIgqRG/hbTUVyv2R2h4cGgmo
# y034Q/EJVP9OQHmAOHyb6yWmFTTxIdLrvo+Ob6z3g2QIgWC+/e72YNBb8DO4Z8cW
# huUOYpxcU2mp/jlWyFXBDwQJUplUkyYeJhLQgM7bnGSqd467jvRolQ==
# SIG # End signature block
