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




[Still in Progress]



 

 
 

