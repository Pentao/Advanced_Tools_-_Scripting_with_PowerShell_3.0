#Parameterizing your Script
#Add the Param block
function t{
[CmdletBinding()]
param (
    [String]$ComputerName='Client',
    [String]$Drive='C:'
)

Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -computerName $ComputerName
}

<#
Remember dot sourcing, witch means, if you want to be able to run this pucntion, first you neet to run the scripd in the doted format:
. .\3Params-function.ps1
Now you can call the funtion
t -ComputerName SuperPC01
Note that everytine you change the script you need to dot source it again. 
#>