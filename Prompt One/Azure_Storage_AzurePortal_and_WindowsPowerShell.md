# Azure Storage Operations by Using Azure Portal And Windows PowerShell ISE

This tutorial demonstrates the following operations by using Azure Portal (on-site) and Windows PowerShell ISE:

- Creating an Azure Blob Storage account (non-classic version)
- Creating a container in that storage account
- Seeing what containers exist within the storage account.
- Uploading data to that container
- Seeing items are inside of that container
- Deleting an item in that container
- Deleting the container
- Deleting the storage account

### Prerequisites:

- Azure subscription or free trial account ( [30 day free trial](https://azure.microsoft.com/en-us/pricing/free-trial/))
- Azure PowerShell ( [link](https://github.com/Azure/azure-powershell/releases/download/v3.6.0-February2017/azure-powershell.3.6.0.msi))
- Windows PowerShell ISE ( [link](https://www.microsoft.com/en-us/search/DownloadResults.aspx?q=%22windows%20management%20framework%22%20PowerShell&amp;sortby=Relevancy~Descending))

### Subscribe of free trial account to Azure Storage:

1. Follow the link provides in &#39;Prerequisite&#39; and click on &#39;Start Free&#39;
2. Follow the instruction after the navigated page and complete subscriptions

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/1.png "1")

### Setting up Azure PowerShell and Windows PowerShell ISE

1. Follow the Azure PowerShell link provides in &#39;Prerequisite&#39; and install
2. Follow the Windows PowerShell ISE link provides in &#39;Prerequisite&#39; and check for installation or upgrade

#1 Create Creating an Azure Blob Storage account (non-classic version)

#### Azure Portal:

1. Sign in [Azure Portal](https://portal.azure.com/) to get a visualized view of Azure Storage
2. Select **Add, Storage and Storage Account**
3. Complete the setup of user name and following instructions
4. In my case, I created my first storage account as &#39;boyangwei&#39;
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/2.png "2")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file 
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/4.png "4")
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/5.png "5")
3. Type in instructions to create account (Provided below)

Note: New-AzureStorageAccount takes parameters like Account name, Location, Type of storage account and Label (optional)
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/6.png "6")
 

1. Print out the status of Azure Storage Account by using Get-AzureStoageAccount
2. See the output below: (Which can also be seen in Azure Portal visually)
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/7.png "7")


#2 Creating a container in that storage account

#### Azure Portal

1. Open the overview of storage account
2. Open &#39;+ **Container&#39;** and input the name

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/8.png "8")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file
3. Type in instructions to create account 
4. Account Name 
5. Storage Key (Found in **All Resources &gt; OverView &gt; Acess Key** )
   
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/10.png "10")
 
6. Type in the container&#39;s name you want to create
7. Use New-AzureStorageContext and New-AzureStorageContainer

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/9.png "9")

 Output shown as:

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new1.png "new1")

#3 Seeing what containers exist within the storage account.

#### Azure Portal

1. Open the overview of storage account
2. The information is shown as circled:

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/11.png "11")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions
3.
3.Currently I have 2 containers shown below 
![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/12.png "12")
4.  Type in Account name
5.  Type in Storage Key (Found in **All Resources &gt; OverView &gt; Acess Key** )
6.  Use New-AzureStorageContext and Get-AzureStorageContainer

Output shown as:

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/13.png "13")

#4 Uploading data to that container

#### Azure Portal

1. Open the overview of storage account
2. Open the container you want to upload the data
3. Click on Upload shown in the top right corner in the web

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/14.png "14")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions
3. I uploaded a txt file as shown below

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/15.png "15")

4.  Type in account name and Storage Key
5.  Specify the address of local data you want to up load
6.  Use New-AzureStorageContext and Set-AzureStorageBlobContent

Output shown as:

 ![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/16.png "16")

#5 Seeing items are inside of that container

#### Azure Portal

1. Open the overview of storage account and its container
2. The data is shown on the right

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new2.png "new2")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/17.png "17")

1. Account name and Storage Key
2. Name of container you want to peek into
3. Use New-AzureStorageContext and Get-AzureStorageBlob

Output shown as:

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/18.png "18")

# 6 Deleting an item in that container

#### Azure Portal

1. Open the overview of storage account and its container
2. Click on the data you want to modify
3. Click on delete on the right

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new3.png "new3")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/19.png "19")

1. Account name and Storage Key
2. Name of the container and data you want to delete
3. Use New-AzureStorageContext and Remove-AzureStorageBlob

# 7 Deleting the container

#### Azure Portal

1. Open the overview of storage account and its container
2. Click on the container and click on **delete**

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/20.png "20")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/21.png "21")

1. Account name and Storage Key
2. Name of the container you want to delete
3. Use New-AzureStorageContext and Remove-AzureStorageContainer

# 8 Deleting the Storage Account

#### Azure Portal

1. Open the overview of storage account
2. Click on **delete** on the top right

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new4.png "new4")

#### Windows PowerShell ISE

1. Open Windows PowerShell ISE
2. Open a new file and type in instructions including the name of storage account you want to delete

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new5.png "new5")

Results shown below:

![alt text](https://raw.githubusercontent.com/BoyangW/AzureStorage-Tutorial/master/Prompt%20One/Pictures/new6.png "new6")
