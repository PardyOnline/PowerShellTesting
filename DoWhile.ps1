$i = 1
Do {
    Write-Output "PowerShell Testing $i"
    $i++ # This is important otherwise loop will run forever
} While($i -le 5) 

$i = 5
while ($i -ge 1) {
    Write-Output "More PowerShell Testing $i"
    $i--
}