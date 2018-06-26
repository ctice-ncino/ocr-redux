$doc = "1120s"
$pgNum = "5"
$Dst = "./training_data/" + $doc + "page" + $pgNum + "/"
$Src = "./training_set/" + $doc + "/"
$page = "Page" + $pgNum + ".jpg"
$fileType = "\" + $page
Get-ChildItem -Path $Src -Recurse -Force |
    Where-Object {$_.PSIsContainer} |
        ForEach-Object {
			$destination = $Dst + '/' + $_.Name + "-" + $page
			
			Copy-Item -Path (Join-Path -Path $_.FullName -ChildPath $fileType) -Destination $destination -Force
			
        }