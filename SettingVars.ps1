# Choose Values to replace with variables


[String]$ComputerName=hostname
[String]$Drive='C:'

Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName