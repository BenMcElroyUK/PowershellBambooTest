function PesterTest {
    $a = Get-ChildItem
    foreach ($file in $a)
    {
        get-item $a
    }
}
