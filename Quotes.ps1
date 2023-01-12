
# Quotation Marks

# Double quotes resolve the variable
$i="PowerShell"

"This is the var $i, and $i is great"
'This is the var $i, and $i is great'
"This is the var `$i, and $i is great"

$computerName=hostname
Get-Service -Name BITS | Select-Object @{Name='MachineName';Expression={$computerName}},
Name, Status 

$p = Get-Process lsass
"Process ID = $($p.id)"
