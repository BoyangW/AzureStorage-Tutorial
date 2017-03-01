# Provision HDinsight by Window Powershell ISE

$clusterName = "wbyhdi01"
$clusterNodes = 1
$clusterVersion = "3.0"
$location = "EAST US"
$clusterUserName = "admin"
$clusterPassword = "password1"

$storageAccountName = "wbyhdistore01"
$containerName = "wbyhdi01"

# Creating a storage account
Write-Host "Create storage account ..." -ForegroundColor Green
New-AzureStorageAccount -StorageAccountName $storageAccountName `
                        -Location $location

# Creating a storage container
Write-Host "Create Blob container ..." -ForegroundColor Green
$storageAccountKey = Get-AzureStorageKey $storageAccountName | %{ $_.Primary}
$destContext = new-AzureStorageContext -StorageAccountName $StorageAccountName `
                                       -StorageAccountKey $StorageAccountKey
new-AzureStorageContainer -Name $containerName `
                          -Context $destContext

# Creating a new HDinsight cluster
Write-Host "Create HDinsight cluster ..." -ForegroundColor Green
$passwd = ConvertTo-SecureSring $clusterPassword -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ($clusterUsername, $passwd)

New-AzureHDInsightCluster -Name $clusterName `
                          -Location $location `
                          -DefaultStorageAccountName "$storageAccountName.blob.core.windows.next" `
                          -DefaultStorageAccountKey $storageAccountKey `
                          -DefaultStorageContainerName $containerName `
                          -ClusterSizeInNodes $clusterNodes `
                          -Version "3.0" `
                          -Credential $creds

Get-AzureHDInsightCluster -Name $clusterName
