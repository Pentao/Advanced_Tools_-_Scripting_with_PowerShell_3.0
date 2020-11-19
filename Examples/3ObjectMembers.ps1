#0bject Members and variables 
#variables are very flexible 
$Service=Get-Service -Name bits 
$Service | GM 
$Service.Status 
$Service.stop() 
$Msg="service Name is $($service.name.TOUpper())" 
$Msg
#working with multiple objects 
$Services=Get-service 
$Services[0]
$Services[0].Status
$Service[-1].Name
