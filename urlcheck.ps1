Set-ExecutionPolicy RemoteSigned
$logpath = "C:\powershell logs\"

#build filename from parts
$outputfile = "{0}\{1:dd.yyyy.MM-hh.mm.ss}-site_response.txt" -f $logpath, $(Get-Date)

$sitelist =  Get-Content C:\install\psscripts\sites.txt

Foreach($url in $sitelist) {
    $request = [net.WebRequest]::Create($url)
    $response = $request.GetResponse()    
    $content = $response.ResponseUri    
    $response.ResponseUri, $response.LastModified, $response.StatusCode | format-list | Out-File $outputfile -append    
    $response.Close()           
}



