IT-EternalFlamesAnimationCorp
Simulated Global AD Infrastructure & AWS Integration

Project Overview:
This project involves the design and implementation of a cross-region IT infrastructure for a simulated animation studio, EternalFlamesAnimationCorp. 
The architecture uses a Windows-based internal system integrated with a hybrid cloud model via AWS for backup and global production workflows.


Key Objectives
 - Hybrid-Cloud Architecture: Integrated local file systems with AWS S3 for off-site backup and global  asset sharing.
 - Multi-Region Domain: Engineered a hierarchical Active Directory structure with regional OUs to manage international staff and hardware.
 - Secure Network Connectivity: A secure VPN tunnel using WireGuard connects cloud infrasructure with on premise domain services 
 - Automated Sync: Developed a data pipeline using PowerShell, Robocopy, and AWS CLI to synchronize production renders to the cloud.

Technical Stack:
- Directory Services: Window Server 2022 (AD, DS, DNS, File Services, GPO)
- Cloud infrastructure: AWS(EC2 Tokyo/US Region, S3 Buckets)
- Networking: Wireguard VPN, Static IPv4, DNS Forwarding,Oracle VM VirtualBox Bridge networking
- Automation/Scripting: Powershell, robocopy, AWS CLI

Infrastructure Design:
1.Global Active Directory Logic
   <img width="495" height="36" alt="image" src="https://github.com/user-attachments/assets/9f7c22de-529e-43a8-943c-a3dadfa26d8b" />
Example:
-USA
   -Corporate
   -Production
-Japan
   -Corporate
   -Production
-CN (still in development)

Role-based access control is enforced through Group Policy and NTFS permissions.
Policies include:
    password security
    department drive mapping
    file sharing restrictions

2. Secure Site to Cloud Networking:
A secure VPN tunnel was created using WireGuard to connect the internal domain network with cloud infrastructure hosted on Amazon EC2.

This allows cloud instances to:
    Authenticate against the domain controller
    Access internal network resources
    Operate as part of the corporate network

3.Global Storage & S3 Strategy
Cloud storage is implemented using Amazon S3.
Regional Buckets
Regional S3 buckets are planned for:
    USA
    Japan
    China (in development)
This reduces latency and cross-region transfer costs.
Cross-Region Collaboration (In Development)

A Global-Assets S3 bucket is planned for shared production files between international teams.

Implementation Progress:
1.The environment was built using Oracle VM VirtualBox, where a Windows Server file server and domain controller were deployed.
 <img width="940" height="729" alt="image" src="https://github.com/user-attachments/assets/de177734-0338-48eb-b4be-3e34e97c4313" />
2. Active Directory Configuration
Organizational Units and Group Policy Objects were configured to manage departments and user roles.
 <img width="935" height="753" alt="image" src="https://github.com/user-attachments/assets/c2de3e13-8ad2-41d6-b83c-7c42fe0ab244" />
3. Automated User Provisioning
To simulate a company environment, employee data was generated using a CSV file.
Using PowerShell automation, the system:
-imports employee data
-creates domain accounts
-assigns users to correct OUs
-applies role-based permissions
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



 

 
 

