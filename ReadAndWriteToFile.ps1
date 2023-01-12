# Parenthesis Demo

# Create a var to hold paths to each file
$txtfile='C:test.txt'
$csvfile='C:test.csv'

$data = Get-Service

# Write data to text file
$data | Out-File -FilePath $txtfile

# Write data to CSV file
$data | Export-Csv -Path $csvfile -NoTypeInformation

# Read data from text file
$textData = Get-Content -Path $txtfile
Write-Output "Data from text file:"
Write-Output $textData

# Read data from CSV file
$csvData = Import-Csv -Path $csvfile
Write-Output "Data from CSV file:"
Write-Output $csvData
