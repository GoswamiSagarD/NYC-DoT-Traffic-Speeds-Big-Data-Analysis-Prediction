$csv = get-content "" -first 5000000
$length = $csv.count

$take = 100000
$header = "ID,SPEED,TRAVEL_TIME,STATUS,DATA_AS_OF,LINK_ID,LINK_POINTS,ENCODED_POLY_LINE,ENCODED_POLY_LINE_LVLS,OWNER,TRANSCOM_ID,BOROUGH,LINK_NAME"

for ($skip = 0; $skip -lt $length/$take; $skip++) {
    $records = $csv | select-object -first $take -skip $($take*$skip)
    if ($skip -ne 0)
    {
        $records+=$header
    }
    
    $records | out-file "$($PSScriptRoot)/$($skip+1) $($take).csv"
}
