#Parameterizing your Script
#Add the Param block

[CmdletBinding()]
param (
    [String]$ComputerName='Client',
    [String]$Drive='C:'
)

Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -computerName $ComputerName
