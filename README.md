IT-EternalFlamesAnimationCorp
Simulated Global AD Infrastructure & AWS Integration

Project Overview

This project involves the design and implementation of a cross-region IT infrastructure for a simulated animation studio, EternalFlamesAnimationCorp. 
The architecture uses a Windows-based internal system integrated with a hybrid cloud model via AWS for backup and global production workflows.


Key Goals

 -   Hybrid Cloud Architecture: Create a system design for a cross-region animation company using a hybrid cloud system for backup and storage.
 -   Multi-Region Windows Domain: Establish a Windows domain structure with specific branches for different regions, including Japan and China.
 -   Granular Security and Group Policy: Implement Group Policy Objects (GPOs) to manage roles, rules, and computer assignments for members within their respective groups.
 -   Permission Management: Define strict file system restrictions and permissions.
 -   IT personnel are granted access to production and cloud storage to manage synchronization via Robocopy and AWS CLI.
 -   Global Data Strategy: Deploy regional AWS S3 buckets for localized data, alongside a cross-region bucket to facilitate collaboration and backup between different global branches.


Infrastructure Design
Windows Active Directory

   - Structure: Multi-region domain setup (US, Japan, and China).
   - User Management: New members are assigned to specific groups based on their department or role.
   - GPO: Automated policy enforcement for internal system groups and assigned hardware.

File System and Storage

   - Access Control: Restricted permissions based on role, with IT maintaining administrative access for management.
   - Synchronization: Integration of local working files with AWS cloud storage using AWS CLI and Robocopy.

AWS Integration

   - Regional Buckets: Separate S3 buckets for Japan and China to manage regional data.
   - Collaboration: Dedicated cross-region buckets for projects requiring inter-branch cooperation.
   - Redundancy: Automated backup of critical working files to the cloud.

Technical Stack

  -  Operating Systems: Windows Server (Active Directory, File Services).
  -  Cloud Services: AWS S3, AWS CLI.
  -  Tools: PowerShell, Robocopy, Git/GitHub for documentation.



Timeline: 
day1: Planning
day2: create Active Directory and generate users organize them into role
day3: scripting for robocopy and aws 
day4: continue
day5: generate different branches 
days6: finalize project 


Problem encounter along the way:
  This is big learning experience for me along the way i encounter alots of problem but beside that they enforce my knowledge even more 
  For VM i used virtual box
  -First problem i encounter is related to VM where we have to connect and change server to static IP and then change DNS of other user machine to the server, since with the NAT type they cannot connect with network. 
   During that time I set up the wifi adapter wrong so i set it to bridge adapter and using my built in adapter for both user and server to communicate with each other 
