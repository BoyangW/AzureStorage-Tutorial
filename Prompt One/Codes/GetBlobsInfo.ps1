$StorageAccountName = "boyangwei" 
$StorageAccountKey = "cSRE7EdRkZNnqNv3V71l11kk1q/RkRsInZiLaCdqxz6tGLgEG8DO7Jl1ZgJ0l6uybPtQSgxQowbn0pd34jLUjA=="

$ctx = New-AzureStorageContext -StorageAccountName $StorageAccountName ` -StorageAccountKey $StorageAccountKey
Get-AzureStorageBlob -Container "containertwo" -Context $ctx