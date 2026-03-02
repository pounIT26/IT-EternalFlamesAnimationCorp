# 1. Define Paths
$Source = "\\USA-LAX-S3GW-01\S3_Storage_share"

$Dest = "s3://us-eternalflams.ac/US-upload/"

$LogFile = "C:\Logs\sync_report.log"


# 2. Add a Timestamp to the log

(Get-Date).ToString("yyyy-MM-dd HH:mm:ss") + " - Starting Sync Task" | Out-File -FilePath $LogFile -Append

# 3. Run Sync and capture BOTH Success and Errors (2>&1)

aws s3 sync "$Source" "$Dest" >> "$LogFile" 2>&1


# 4. Final Timestamp

(Get-Date).ToString("yyyy-MM-dd HH:mm:ss ") + " - Task Completed`n" | Out-File -FilePath $LogFile -Append