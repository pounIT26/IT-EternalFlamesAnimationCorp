# Import the Active Directory Module
Import-Module ActiveDirectory

# Load your new CSV data
$staff = Import-Csv "C:\path\to\your\Corporate_Staff.csv"

foreach ($person in $staff) {
    # 1. Create the User Account with Description
    New-ADUser -Name "$($person.Firstname) $($person.Lastname)" `
               -GivenName $person.Firstname `
               -Surname $person.Lastname `
               -SamAccountName $person.Username `
               -UserPrincipalName "$($person.Username)@EternalFlamesAnimeCorp.local" `
               -Path $person.OUPath `
               -AccountPassword (ConvertTo-SecureString $person.Password -AsPlainText -Force) `
               -Description $person.Description `
               -ChangePasswordAtLogon $true `
               -Enabled $true

    # 2. Add User to the specific Role Group shown in your image
    Add-ADGroupMember -Identity $person.RoleGroup -Members $person.Username

    # 3. Create the Workstation Object in the WorkStation OU
    New-ADComputer -Name $person.Workstation `
                   -Path $person.ComputerOU `
                   -Description "Assigned to $($person.Username)" `
                   -Enabled $true

    Write-Host "Success: $($person.Username) added to $($person.RoleGroup) with Workstation $($person.Workstation)" -ForegroundColor Green
}