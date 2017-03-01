# Azure HdInsight Operations by Using Windows PowerShell ISE

This tutorial demonstrates the following operations by using Windows PowerShell ISE:

- Creating an HDInsight cluster
- Submitting a MapReduce job the cluster and executing it
- Transferring results of the job to a blob storage or ADLS storage
- Deleting the HDInsight cluster


### Prerequisites:

- Azure subscription or free trial account ( [30 day free trial](https://azure.microsoft.com/en-us/pricing/free-trial/))
- Azure PowerShell ( [link](https://github.com/Azure/azure-powershell/releases/download/v3.6.0-February2017/azure-powershell.3.6.0.msi))
- Windows PowerShell ISE ( [link](https://www.microsoft.com/en-us/search/DownloadResults.aspx?q=%22windows%20management%20framework%22%20PowerShell&amp;sortby=Relevancy~Descending))
- Create an HDInsight cluster (Including the followings:)
  -	Create an Azure resource group
  -	Create an Azure Storage account
  -	Create an Azure Blob container


### Subscribe of free trial account to Azure Storage:

1. Follow the link provides in &#39;Prerequisite&#39; and click on &#39;Start Free&#39;
2. Follow the instruction after the navigated page and complete subscriptions

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/1.png "1")

### Setting up Azure PowerShell and Windows PowerShell ISE

1. Follow the Azure PowerShell link provides in &#39;Prerequisite&#39; and install
2. Follow the Windows PowerShell ISE link provides in &#39;Prerequisite&#39; and check for installation or upgrade

#1 Creating an HDInsight cluster

1. Open Windows PowerShell ISE
2. Open a new file on Windows PowerShell ISE
3. Connect to Azure Subscription by using ‘Add-Azureaccount’ command and log in 
Command: 

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20Two/Pictures/1.png "1")
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20Two/Pictures/2.png "2")

4. Specify the name of HDInsight Cluster (Here I used String ‘token’)
5. Specify the names of resource group, new storage account and new storage container
6. Use the following commands to create an Azure resource group, an Azure storage account and container
7. Create a new HDInsight Cluster 
8. The codes are provided below:

It takes some time (about 20 minutes) to create the cluster <br>
When creating the HDInsight cluster, it will let you type the credentials for Hadoop User Account ($cluseterCredentials) and SSH user ($sshCredentials) <br>
Default name for Hadoop User Account is ‘admin’ <br>

The results are shown below:
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20Two/Pictures/3.png "3")
