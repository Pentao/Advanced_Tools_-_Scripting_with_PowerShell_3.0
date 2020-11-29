<#
    Comment based help
#>
function Verb-Noun {

    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [int]$x
    )
    
    Begin{<#Code#> $total =0}
    Process{<#Code#> $total += $x}
    End{<#Code#> "total = $total"}
}