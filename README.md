
Readme · MD
Copy

# IT-EternalFlamesAnimationCorp

## Simulated Global AD Infrastructure & AWS Integration

> A cross-region IT infrastructure project for a simulated animation studio — featuring Windows Active Directory, hybrid-cloud architecture with AWS, and secure site-to-cloud networking via WireGuard VPN.

---

## Project Overview

This project involves the design and implementation of a full enterprise IT environment for **EternalFlamesAnimationCorp**, a fictional global animation studio. The architecture uses a Windows-based internal system integrated with a hybrid cloud model via AWS for backup and global production workflows.

The goal is to demonstrate real-world IT administration skills including Active Directory management, Group Policy configuration, cloud storage integration, VPN networking, and automation scripting — all within a simulated multi-region corporate environment.

---

## Key Objectives

| Objective | Description |
|-----------|-------------|
| **Hybrid-Cloud Architecture** | Integrated local file systems with AWS S3 for off-site backup and global asset sharing |
| **Multi-Region Domain** | Engineered a hierarchical Active Directory structure with regional OUs to manage international staff and hardware |
| **Secure Network Connectivity** | Built a secure VPN tunnel using WireGuard connecting cloud infrastructure with on-premise domain services |
| **Automated Sync** | Developed a data pipeline using PowerShell, Robocopy, and AWS CLI to synchronize production renders to the cloud |

---

## Technical Stack

| Category | Technologies |
|----------|-------------|
| **Directory Services** | Windows Server 2022 — AD DS, DNS, File Services, Group Policy |
| **Cloud Infrastructure** | AWS EC2 (Tokyo / US regions), AWS S3 |
| **Networking** | WireGuard VPN, Static IPv4, DNS Forwarding, Oracle VM VirtualBox (bridged networking) |
| **Automation & Scripting** | PowerShell, Robocopy, AWS CLI |
| **Project Management** | Jira (task tracking), Confluence (documentation) |

---

## Infrastructure Design

### 1. Global Active Directory Structure

The domain is organized into regional Organizational Units (OUs), each representing a corporate office:

```
EternalFlamesAnimationCorp.local
├── USA Corporate Production
│   ├── IT
│   ├── Animation
│   ├── Rendering
│   └── Management
├── Japan Corporate Production
│   ├── IT
│   ├── Animation
│   ├── Rendering
│   └── Management
└── CN Corporate Production (In Development)
```

Role-based access control is enforced through Group Policy and NTFS permissions. Policies include:

- Password complexity and account lockout policies
- Department-specific drive mapping via GPO
- File sharing restrictions per security group
- Workstation lockdown policies

### 2. Secure Site-to-Cloud Networking (WireGuard VPN)

A secure WireGuard VPN tunnel connects the on-premise domain network with AWS EC2 instances. The EC2 instances serve strictly as **VPN bridge devices** — they route Active Directory authentication, DNS resolution, and Group Policy traffic between remote offices and the on-premise domain controller. They do not host production services or interact with day-to-day operations.

```
┌──────────────────────┐         WireGuard VPN Tunnel          ┌───────────────────────┐
│   On-Premise Domain  │ ◄──────────────────────────────────►  │    AWS EC2 Instance   │
│   (VirtualBox Lab)   │          Encrypted Tunnel             │   (Tokyo / US Region) │
│                      │                                       │                       │
│  - Domain Controller │                                       │  - VPN Bridge Only    │
│  - DNS Server        │                                       │  - Routes AD/DNS/GPO  │
│  - File Server       │                                       │  - IP Forwarding      │
│    (USA-LAX-FS-01)   │                                       │  - No production      │
│  - S3 Gateway        │                                       │    services hosted    │
│    (USA-LAX-S3GW-01) │                                       │                       │
└──────────────────────┘                                       └───────────────────────┘
```

**What the VPN handles:** AD authentication, DNS queries, GPO distribution, and domain join traffic for remote offices (Japan) routing through the EC2 bridge back to the on-premise DC.

**What the VPN does NOT handle:** The S3 backup pipeline. File backups go from the on-premise S3 gateway (USA-LAX-S3GW-01) directly to AWS S3 using AWS CLI over the regular internet connection — not through the VPN tunnel.

```
VPN Traffic:   Japan Workstation ──► EC2 Bridge ──► On-Premise DC (AD/DNS/GPO only)

Backup Traffic: USA-LAX-FS-01 ──Robocopy──► USA-LAX-S3GW-01 ──AWS CLI──► AWS S3 (direct, no VPN)
```

### 3. Global Storage & S3 Strategy

Cloud storage is implemented using Amazon S3 with a regional bucket strategy:

| Bucket | Region | Status |
|--------|--------|--------|
| USA Production Bucket | us-west-2 | ✅ Active |
| Japan Production Bucket | ap-northeast-1 | ✅ Active |
| China Production Bucket | cn-north-1 | 🔧 In Development |
| Global-Assets (shared) | Multi-region | 🔧 In Development |

Regional buckets reduce latency and cross-region transfer costs. A **Global-Assets** bucket is planned for shared production files between international teams.

---

## Implementation

The full environment was built in Oracle VM VirtualBox with Windows Server 2022 as the foundation. Detailed step-by-step implementation guides with screenshots are documented in Confluence:

- [AD Implementation Guide](https://gng-6679.atlassian.net/wiki/external/Y2VkY2RiNzY1YzhmNDI5NmJkYWE1YmI4ZjM5YWQyMWI) — Server roles, OU structure, automated user provisioning, GPO configuration, DNS CNAME records, drive mapping
- [VPN Setup & Troubleshooting Guide](https://gng-6679.atlassian.net/wiki/external/YWIyNDcxMTAwZDI1NGM3N2JiNWQzMjMwYWJkYzkxOTM) — WireGuard installation on all machines, peer configuration, IP forwarding on bridge device, `sc.exe` auto-start, DNS setup, common troubleshooting steps
  
- Others (🔧In Development )
---
## Status

| Component | Status |
|-----------|--------|
| Active Directory (USA) | ✅ Complete |
| Active Directory (Japan) | ✅ Complete |
| Active Directory (China) | 🔧 In Development |
| WireGuard VPN | ✅ Complete |
| S3 Backup Pipeline (USA) | ✅ Complete |
| S3 Rollback & Versioning Recovery | ✅ Complete |
| Drive Mapping GPO | ✅ Complete |
| User Provisioning (PowerShell) | ✅ Complete |
| CN Region (China Office) | 🔧 In Development |
| Cross-Region Collaboration | ✅ Complete  |

---
