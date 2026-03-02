# 1. Configuration
$ProductionPath = "\\USA-LAX-FS-01\Production" # Replace with your real production UNC path
$SDrivePath = "\\USA-LAX-S3GW-01\S3_Storage_share"
$LogFile = "C:\Logs\Robocopy_Production_toS3Share.log"

# 2. Ensure S: Drive is Mounted (Bridge Step)
 if (!(Test-Path $SDrivePath)) {
     Write-Output "S: Drive not found. Mapping now..."
     net use S: \\USA-LAX-S3GW-01\S3_Storage_share /persistent:yes
 }

 # 3. Robocopy from Production to S:
 # /MIR: Mirrors the folders (deletes from S: if deleted from Production)
 # /MT:32: Multi-threaded for speed (moves 32 files at once)
 # /R:3 /W:5: Retries 3 times, waits 5 seconds between
 # /ZB: Restartable mode (great for network glitches)
robocopy "$ProductionPath" "$SDrivePath" /MIR /MT:16 /R:3 /W:5 /V /XA:SH /XJ /LOG+:"$LogFile" /TEE /NP
