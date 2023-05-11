PowerShell Script to Create Users in Office 365 Silently
This PowerShell script creates users in Office 365 silently using a CSV file that contains user information. You can use this script to create multiple users at once without having to manually enter their information into the Office 365 admin center.

Prerequisites
Before you can use this script, you need to have the following:

An Office 365 account with administrative privileges
Windows PowerShell installed on your computer
Usage Instructions
Follow these steps to use the PowerShell script to create users in Office 365 silently:

Open Windows PowerShell as an administrator.

Connect to Exchange Online by running the following command:

PowerShell
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
Create a CSV file with the user information. The CSV file should contain the following columns:

UserPrincipalName
DisplayName
FirstName
LastName
Password
LicenseAssignment
UsageLocation
Here is an example CSV file:

UserPrincipalName,DisplayName,FirstName,LastName,Password,LicenseAssignment,UsageLocation
johndoe@contoso.com,John Doe,John,Doe,P@ssw0rd!,EMS,EI
Save the CSV file to a location on your computer.

Run the following PowerShell script to create the user using the data from the CSV file:

PowerShell
$UserList = Import-Csv "C:\Users\username\Documents\UserList.csv"

foreach ($User in $UserList) {
    New-MsolUser `
        -UserPrincipalName $User.UserPrincipalName `
        -DisplayName $User.DisplayName `
        -FirstName $User.FirstName `
        -LastName $User.LastName `
        -Password $User.Password `
        -LicenseAssignment $User.LicenseAssignment `
        -UsageLocation $User.UsageLocation `
        -ForceChangePassword $false `
        -PasswordNeverExpires $true `
        -ErrorAction Stop
}
Save and run the PowerShell script.

Parameters
The following parameters are used in the PowerShell script:

UserPrincipalName: The user's email address.
DisplayName: The user's display name.
FirstName: The user's first name.
LastName: The user's last name.
Password: The user's password.
LicenseAssignment: The license to be assigned to the user (e.g., "EMS" for Enterprise Mobility + Security or "E5" for Office 365 E5).
UsageLocation: The location of the user (e.g., "EI" for Ireland or "US" for United States).
ForceChangePassword: Specifies whether the user is required to change their password at first login. Default is false.
PasswordNeverExpires: Specifies whether the user's password ever expires. Default is true.
Conclusion
This PowerShell script is a useful tool for creating users in Office 365 silently, saving time and effort when creating multiple users. With the proper prerequisites and usage instructions in place, this script can help streamline your user creation process.
