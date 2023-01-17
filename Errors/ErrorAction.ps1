$ErrorActionPreference

Get-WmiObject win32_bios -ComputerName localhost, AIT01-03-010

Get-WmiObject win32_bios -ComputerName localhost, AIT01-03-010 -EA SilentlyContinue -EV MyError

Get-WmiObject win32_bios -ComputerName localhost, notonline, AIT01-03-010 -EA Inquire