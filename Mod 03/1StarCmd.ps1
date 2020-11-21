# Start with a command 
# I like to start in the console 
Get-WmiObject -class Win32—logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost'
# The new CIM version if you ike 
Get-CimInstance -className win32_logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost' 
#Might even dress it up 
Get-WmiObject -class Win32—logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost' |
    Select-Object PSComputerName, DeviceID
        @{n='Size(GB';e={$_.Size / 1gb -as [int]}}
        @{n='Free(GB';e={$_.Freespace / 1gb -as [int]}}

#NOTE: Get-WmiObject have been deprecated in PowerShell Core. Please use CIM cmdlets
Get-CimInstance -className win32_logicalDisk -Filter "DeviceID='C:'" -ComputerName 'localhost' |
    Select-Object PSComputerName, DeviceID
        @{n='Size(GB';e={$_.Size / 1gb -as [int]}}
        @{n='Free(GB';e={$_.Freespace / 1gb -as [int]}}
