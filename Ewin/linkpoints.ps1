function Split-Links {
    param (
        [string[]]
        $array
    )
    
    $innerList = @()
    $count = 0
    $array | %{
        $split = $_.Split(",")
        $first = $split[0]
        $second = $split[1]
        [double]$test=$null
        [double]$test1=$null
        $1st = [System.Double]::TryParse($first, [ref] $test)
        $2nd =[System.Double]::TryParse($second,[ref]$test1)
        $check = $1st -eq $true -and $2nd -eq $true 
        $check2 = $first.Length -gt 2 -and $second.Length -gt 2
        if ($check -and $check2)
        {
            $tuple = [System.Tuple]::Create($test,$test1)
            $innerList= $innerList+$tuple
        }
        else
        {
            $count++
        }
        
    }
    return $innerList
}

$file = Get-Content '/Users/minoseah629/Desktop/ait614/linkpoints by id.json/part-00000-8ae4aabe-8a81-409f-a590-60febc4bab2f-c000.json'

$list = [System.Collections.Generic.Dictionary[string, [System.Tuple[double,double][]]]]::new()

$file | %{ 
    $item = ConvertFrom-Json $_
    $points = $item.'Link Points' | ConvertFrom-Json
    $out = Split-Links $points
    if(!$list.ContainsKey($item.id))
    {
        $list.Add([string]$item.id, $out)
    }
    else {
        $existing = $list[$item.id].Count
        write-host "Existing = $existing and new has $($out.count)"
    }
    # $list.Add()
}