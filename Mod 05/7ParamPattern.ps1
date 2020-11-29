function Get-CompInfo{
    [CmdletBinding()]
    param (
        #Want to support multiple computers            
        [Parameter(Mandatory=$True,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true,
                    HelpMessage='One or more computer names')] <#This is not a very helpful message 
                        NOTE: as of 29/11/2020 '!? will not be displayed on VSCode, check out the following issue on GitHub
                        https://github.com/PowerShell/vscode-powershell/issues/836 
                        #>
        [string[]]$ComputerName,
        
        [ValidatePattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\b")] <#This is a regular expression that will validate the pattern
                                                             of the input data, in tis case an IP address, so 4 octets
                                                             in dotted decimal notation where accepted values are 0 to 255
                                                             get-help about_Functions_Advanced_Parameters search for 'Validate'#>
        [String]$IPAddress,

        #Switch to run on Error Logging
        [Switch]$ErrorLog,
        [String]$LogFile = 'c:\errorlog.txt'  
    )
    begin {
        if($ErrorLog){
                Write-Verbose 'Error logging turned on'
            } else {
                Write-Verbose 'Error logging turned off'
            }
            foreach($Computer in $ComputerName){
                Write-Verbose "Computer: $Computer"
             }
    }
    process {     
        foreach($Computer in $ComputerName){
            $os=Get-Wmiobject -ComputerName $Computer -Class Win32_OperatingSystem
            $Disk=Get-WmiObject -ComputerName $Computer -class Win32_LogicalDisk -filter "DeviceID='c:'"

            $Prop=[ordered]@{
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