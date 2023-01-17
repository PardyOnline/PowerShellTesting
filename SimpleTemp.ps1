Function Verb-Noun {
    
    [CmdletBinding()]
    Param(
        [Parameter(valuefrompipeline=$true)]
        [int]$x
        # [Parameter()][Int]$MyInt
    )

    Begin{<#Code#> $total = 0}
    Process{<#Code#> $total += $x}
    End{<#Code#> "total = $total"}
}