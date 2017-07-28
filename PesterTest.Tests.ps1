$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "PesterTest" {
    It "Iterates through items" {
        Mock Get-ChildItem {
        @(
            [PSCustomObject]`
            @{ Name = 'shouldbecopied.JPG'; },`
            [PSCustomObject]`
            @{ Name = 'shouldbecopiedalso.JPG'; }
        )
        }   
        Mock Get-Item {}
        PesterTest
        Assert-MockCalled Get-Item -Times 1 -Exactly
    }
}
