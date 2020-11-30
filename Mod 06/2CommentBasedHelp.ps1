<#
.SYNOPSIS
    This function will gather basic computer information
.DESCRIPTION
    This function will gather basic computer information
    From multiple computerse and provide error logging information
.PARAMETER ComputerName
This parameter supports multiple computer names to gather
data from. This parameter is Mandatory
.EXAMPLE
    Getting information from the local computer
    Get-CompInfo -ComputerName .
.EXAMPLE
    Getting information from remote computers
    Get-CompInfo -ComputerName comp1, comp2
.EXAMPLE
    Getting information from computers in a text file
    Get-Content c:\servers.txt | get-CompInfo
.EXAMPLE
    Get-CompInfo -hostname localhost
    ComputerName OS Name                  OS Build FreeSpace
    ------------ -------                  -------- ---------
    localhost    Microsoft Windows 10 Pro                 82
#>
function Get-CompInfo{
    [CmdletBinding()]
    param (  
        #Want to support multiple computers            
        [Parameter(Mandatory=$True,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true,
                    HelpMessage='One or more computer names')]
        [alias('hostname')] 
        [string[]]$ComputerName,        
        [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\b")] 
        [String]$IPAddress,

        #Switch to turn on Error Logging
        [Switch]$ErrorLog,
        [String]$LogFile = 'c:\errorlog.txt'  
    )
    begin {}
    process {     
        foreach($Computer in $ComputerName){
            $os=Get-Wmiobject -ComputerName $Computer -Class Win32_OperatingSystem
            $Disk=Get-WmiObject -ComputerName $Computer -class Win32_LogicalDisk -filter "DeviceID='c:'"

            $Prop=[ordered]@{ #With or withouth [ordered]
                'ComputerName'=$Computer;
                'OS Name'=$os.caption;
                'OS Build'=$os.buildnumbre;
                'FreeSpace'=$Disk.FreeSpace / 1gb -as [int]
            }
        #This doesn't produce objects yet - just for testing
        $obj=New-Object -TypeName PSObject -property $Prop
        Write-output $obj
        }
    }
    end {        
    }
}