﻿$StorageAccountName = "boyangwei" 
$StorageAccountKey = "cSRE7EdRkZNnqNv3V71l11kk1q/RkRsInZiLaCdqxz6tGLgEG8DO7Jl1ZgJ0l6uybPtQSgxQowbn0pd34jLUjA=="

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName ` -StorageAccountKey $StorageAccountKey
$ContainerName = “containertwo”
$BlobName = “Upload.txt”
Remove-AzureStorageBlob -Blob $BlobName -Container $ContainerName -Context $ctx