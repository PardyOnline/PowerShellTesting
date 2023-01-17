# Importing module from current location
Import-Module <# Your Path here #> 'C:\Users\spardy\Desktop\Powershell Scripting Tutorial\MyTools.psm1'

# Listing the commands it contains
Get-Command -Module MyTools

# Remove the module
Remove-Module MyTools

# Putting the module in its proper place
$Path=$env:PSModulePath -split ";"
$Path[0]

$ModulePath=$Path[0] + "\MyTools"
$ModulePath

New-Item $ModulePath -Itemtype Directory
Copy-Item 'C:\Users\spardy\Desktop\Powershell Scripting Tutorial\MyTools.psm1' -Destination $ModulePath -Force