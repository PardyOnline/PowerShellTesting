# Variables
# Assigning a variable
$var = 2
$var1 = "Hello"

#Output using F8/Write-Output
$var
$var1
Write-Output $var1

# Strongly type a var
[String]$MyName="Sean"
#[int]$Wrong="Sean"

# x can only equal a, b, c - or else you get an error
[validateset("a","b","c")][string]$x = "a"

[string]$CompName=Read-host "Enter Computer Name"
Write-Output $CompName

# Day of Week Example
$d = "12/25/13"
[datetime]$d = "12/25/13"
$d.DayOfWeek
$d.AddDays(-(7*6))

# Signs a file
param([string] $file=$(throw "Please specify a filename."))
$cert = @(Get-ChildItem cert:\CurrentUser\My -codesigning)[0]
Set-AuthenticodeSignature $file $cert