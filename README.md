IT-EternalFlamesAnimationCorp
Simulated Global AD Infrastructure & AWS Integration

Project Overview:
This project involves the design and implementation of a cross-region IT infrastructure for a simulated animation studio, EternalFlamesAnimationCorp. 
The architecture uses a Windows-based internal system integrated with a hybrid cloud model via AWS for backup and global production workflows.


Key Goals
 - Hybrid-Cloud Architecture: Integrated local file systems with AWS S3 for off-site backup and global asset sharing.
 - Multi-Region Domain: Engineered a hierarchical Active Directory structure with regional OUs to manage international staff and hardware.
 - Zero-Trust Networking: Implemented Tailscale (WireGuard) to establish a secure mesh network between on-premise servers and AWS EC2 instances.
 - Automated Sync: Developed a data pipeline using PowerShell, Robocopy, and AWS CLI to synchronize production renders to the cloud.

Technical Stack:
- Directory Services: Window Server 2022 (AD, DS, DNS, File Services, GPO)
- Cloud infrastructure: AWS(EC2 Tokyo/US Region, S3 Buckets)
- Networking: Tailscale (Mesh VPN), Static IPv4, DNS Forwarding, Bridge Adapters
- Automation/Scripting: Powershell, robocopy, AWS CLI

Infrastructure Design:
1. Global Active Directory Logic
   
  -  Regional OUs: Hierarchical structure organized by Region (USA, JP, CN [Still in develop]) → Department (Corporate, Production) → Role-Based Groups.
  -  RBAC & GPO: Enforced Role-Based Access Control and regional compliance policies (e.g., mapped drives, security restrictions) via Group Policy. For example password safety or file sharing ntfs.

2. Secure Mesh Networking (Tailscale)

 - The Bridge: Deployed Tailscale to create an encrypted overlay network, bypassing NAT/Firewall complexities.
 - Cloud Join: Successfully joined a Japan-based AWS EC2 instance to the USA-based Domain Controller over the Tailscale "Tailnet," ensuring low-latency authentication for international staff.

3. Global Storage & S3 Strategy

   - Localized Buckets: Regional S3 buckets for Japan and China to minimize data egress costs and latency.
   - Cross-Region Collaboration [Still in development] : Dedicated "Global-Assets" buckets for inter-branch project synchronization.
  

 Progress:
 -using VMBOX we set a new window fileserver then set up and add domain
 <img width="940" height="729" alt="image" src="https://github.com/user-attachments/assets/de177734-0338-48eb-b4be-3e34e97c4313" />
 -set up OU and GPO for active directory
 <img width="935" height="753" alt="image" src="https://github.com/user-attachments/assets/c2de3e13-8ad2-41d6-b83c-7c42fe0ab244" />
 -Since our data was to simulate the company we generating a employee sheeet csv and using shell scripting to import them into active directory with role and permission using this later we can import mass amount of employee with organize structure

 <img width="945" height="755" alt="image" src="https://github.com/user-attachments/assets/3f73384c-91c4-4923-8cba-0f5bb0877fe0" />
-this is a example where i added 2 new employee for us_corporate side with their own work station and password from csv with role 
<img width="742" height="41" alt="image" src="https://github.com/user-attachments/assets/7d8160c6-1fee-40b4-b8f8-ca304bbddb64" />
<img width="943" height="648" alt="image" src="https://github.com/user-attachments/assets/ff2d08b4-5977-4fdc-9b7e-6adf50de5cc3" />
<img width="949" height="666" alt="image" src="https://github.com/user-attachments/assets/4b7dec54-7f87-48f8-9c19-dd959f98153a" />
-Next step we want to create drive mapping gpo for each department. In this case example i set up for IT with GPO mapping both drive together since this is a simulation we create a CNAME records to point the drive to Server
<img width="846" height="567" alt="image" src="https://github.com/user-attachments/assets/1415b86a-cc46-4417-9faf-909100b856ae" />
<img width="878" height="637" alt="image" src="https://github.com/user-attachments/assets/5fc95b35-8c77-4339-8b52-a6ccfa0c1e96" />
-brief explanation of these and what they do USA-LAX-FS-01 is a file server of production team and we want it to back up to USA-LAX-S3GW-01 like a hot and cold drive so later of the day it can upload to S3 bucket on cloud *these scripts only be accessible through it department especially the account svc_s3 since it have permission to the s3 server and file mapping of USA-LAX-FS-01 and USA-LAX-S3GW-01
<img width="910" height="688" alt="image" src="https://github.com/user-attachments/assets/3cdda552-f29a-4c9f-a4ce-496053edd88f" />
we need task scheduler for this role to run powershell robocopy each 2 hours then 1 at the end of the day for S3 
<img width="946" height="661" alt="image" src="https://github.com/user-attachments/assets/922fe8d7-267d-4109-bd33-c3246250076f" />
<img width="637" height="476" alt="image" src="https://github.com/user-attachments/assets/ebc3905f-9018-403f-a15b-a415bec3602e" />


they also give out log file 
<img width="958" height="675" alt="image" src="https://github.com/user-attachments/assets/a2b56d82-21db-4afd-a1a2-a49fa7578944" />


<img width="1847" height="686" alt="image" src="https://github.com/user-attachments/assets/05636954-9754-41bd-9ab7-bb8644b2eaa9" />



[Still in Progress of documenting]



 

 
 

