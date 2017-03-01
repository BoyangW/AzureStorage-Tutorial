 # Login to your Azure subscription
 # Check if there is an active subscription
 $sub = Get-AzureRmSubscription -ErrorAction SilentlyContinue
 if(-not($sub))
 {
     Add-AzureRmAccount
 }

 # Get cluster info
 $clusterName = Read-Host -Prompt "Enter the HDInsight cluster name"
 $creds=Get-Credential -Message "Enter the login for the cluster"

 #Get the resource group, storage, etc.
 $clusterInfo = Get-AzureRmHDInsightCluster -ClusterName $clusterName
 $resourceGroup = $clusterInfo.ResourceGroup
 $storageAccountName=$clusterInfo.DefaultStorageAccount.split('.')[0]
 $container=$clusterInfo.DefaultStorageContainer
 $storageAccountKey=(Get-AzureRmStorageAccountKey `
     -Name $storageAccountName `
 -ResourceGroupName $resourceGroup)[0].Value

 #Create a storage content and upload the file
 $context = New-AzureStorageContext `
     -StorageAccountName $storageAccountName `
     -StorageAccountKey $storageAccountKey

 #Define the MapReduce job
 # -JarFile = the JAR containing the MapReduce application
 # -ClassName = the class of the application
 # -Arguments = The input file, and the output directory
 $wordCountJobDefinition = New-AzureRmHDInsightMapReduceJobDefinition `
     -JarFile "wasb:///example/jars/hadoop-mapreduce-examples.jar" `
     -ClassName "wordcount" `
     -Arguments `
         "wasb:///example/data/gutenberg/davinci.txt", `
         "wasb:///example/data/WordCountOutput"

 #Submit the job to the cluster
 Write-Host "Start the MapReduce job..." -ForegroundColor Green
 $wordCountJob = Start-AzureRmHDInsightJob `
     -ClusterName $clusterName `
     -JobDefinition $wordCountJobDefinition `
     -HttpCredential $creds

 #Wait for the job to complete
 Write-Host "Wait for the job to complete..." -ForegroundColor Green
 Wait-AzureRmHDInsightJob `
     -ClusterName $clusterName `
     -JobId $wordCountJob.JobId `
     -HttpCredential $creds
 # Download the output
 Get-AzureStorageBlobContent `
     -Blob 'example/data/WordCountOutput/part-r-00000' `
     -Container $container `
     -Destination output.txt `
     -Context $context
 # Print the output of the job.
 Get-AzureRmHDInsightJobOutput `
     -Clustername $clusterName `
     -JobId $wordCountJob.JobId `
     -HttpCredential $creds

cat ./example/data/WordCountOutput/part-r-00000 | Findstr "there"