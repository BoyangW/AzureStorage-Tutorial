$StorageAccountName = "boyangwei" 
$StorageAccountKey = "cSRE7EdRkZNnqNv3V71l11kk1q/RkRsInZiLaCdqxz6tGLgEG8DO7Jl1ZgJ0l6uybPtQSgxQowbn0pd34jLUjA=="

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName ` -StorageAccountKey $StorageAccountKey
$localTargetDirectory = "C:\Users\wby20\Desktop\Download"
$ContainerName = "containerthree"
$BlobName = "Upload.txt" 
Get-AzureStorageBlobContent -Blob $BlobName -Container $ContainerName ` -Destination $localTargetDirectory -Context $ctx