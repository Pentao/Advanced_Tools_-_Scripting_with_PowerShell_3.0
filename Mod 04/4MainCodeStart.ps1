<#
Same as previous, but now we add in the process section what this script will actually do
the code could be added into the "Begn" but then we wouldn't be able to input from the pipeline.
#>
#Use: Get-CompInfo -ComputerName dc -Errorlog -Verbose
#Use: Get-CompInfo -ComputerName dc -Verbose

function Get-CompInfo{
    [CmdletBinding()]
    param (
        #Want to support multiple computers
        [string[]]$ComputerName,
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
    }
    end {        
    }
}