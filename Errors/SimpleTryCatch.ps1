$c = 'notonline'
Try{
    $os=Get-WmiObject -ComputerName $c -Class Win32_OperatingSystem -ErrorAction Stop -ErrorVariable CurrentError
}

Catch {
    Write-Warning "You messed up with computer $c"
}