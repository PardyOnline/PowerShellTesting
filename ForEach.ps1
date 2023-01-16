$services = Get-Service -name b*
ForEach($s in $services) {
    $s.DisplayName
}

For ($i=0; $i -lt 5; $i++) {
# Do Something
}

1..5 | ForEach-Object -process {
    Start calc
}