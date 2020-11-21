#Choose values to replace with variables 
[String]$ComputerName= 'Client' 
[String]$Drive='C:'
Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -computerName $ComputerName

#Parameterization of a script varibles
param (
    [String]$ComputerName= 'Client',
    [String]$Drive='C:'
)
Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -computerName $ComputerName