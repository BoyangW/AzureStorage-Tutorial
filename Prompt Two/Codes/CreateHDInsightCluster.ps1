
$token ="wby"  # Name of my HDInsight cluster
$subscriptionID = "c76381b8-3a2c-4c70-979a-44b86c390db7"      

$resourceGroupName = $token + "rg"      # Resource Group name
$clusterName = $token
$defaultStorageAccountName = $token + "store"   # Storage account name
$defaultStorageContainerName = $token + "container"  # Storage container name
$location = "East US"     # Location
$clusterNodes = 1           # Number of nodes in the HDInsight cluster

# Sign in to Azure
Login-AzureRmAccount

# Select the subscription
Select-AzureRmSubscription -SubscriptionId $subscriptionID

# Create an Azure Resource Group
New-AzureRmResourceGroup -Name $resourceGroupName -Location $location

# Create an Azure Storage account and container used as the default storage
New-AzureRmStorageAccount `
    -ResourceGroupName $resourceGroupName `
    -StorageAccountName $defaultStorageAccountName `
    -Location $location `
    -Type Standard_LRS
$defaultStorageAccountKey = (Get-AzureRmStorageAccountKey -Name $defaultStorageAccountName -ResourceGroupName $resourceGroupName)[0].Value
$destContext = New-AzureStorageContext -StorageAccountName $defaultStorageAccountName -StorageAccountKey $defaultStorageAccountKey
New-AzureStorageContainer -Name $defaultStorageContainerName -Context $destContext

# Create an HDInsight cluster
$credentials = Get-Credential -Message "Enter Cluster user credentials" -UserName "admin"
$sshCredentials = Get-Credential -Message "Enter SSH user credentials"

$location = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -StorageAccountName $defaultStorageAccountName | %{$_.Location}

New-AzureRmHDInsightCluster `
    -ClusterName $clusterName `
    -ResourceGroupName $resourceGroupName `
    -HttpCredential $credentials `
    -Location $location `
    -DefaultStorageAccountName "$defaultStorageAccountName.blob.core.windows.net" `
    -DefaultStorageAccountKey $defaultStorageAccountKey `
    -DefaultStorageContainer $defaultStorageContainerName  `
    -ClusterSizeInNodes $clusterNodes `
    -ClusterType Hadoop `
    -OSType Linux `
    -Version "3.4" `
    -SshCredential $sshCredentials