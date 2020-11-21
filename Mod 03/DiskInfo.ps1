#Makig a function
    Function Get-DiskInfo{
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true)]
            [String]$ComputerName,
            [String]$Drive='c:'       
        )
        Get-WmiObject -Class Win32_logicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName
           Select-Object PSComputerName, DeviceID,
                @{n='Size(GB)';e={$_.Size/1gb -as [int]}},
                @{n='Free(GB)';e={$_.Freespace/1gb -as [int]}}
        }