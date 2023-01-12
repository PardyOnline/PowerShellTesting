# Object members and variables
# Variables are very flexible
$Service=Get-Service -Name bits
$Service | gm
$Service.Status

#Decide start or stop depending on status
#$Service.Start()
#$Service.Stop()
$Msg="Service Name is $($service.Name.ToUpper())"
$msg

# Working with multiple objects
$Services=Get-Service
$services[0]
$services[0].Status
$Services[-1].Name
"Service name is $($services[4].DisplayName)"