$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session


UserPrincipalName,DisplayName,FirstName,LastName,Password,LicenseAssignment,UsageLocation
johndoe@contoso.com,John Doe,John,Doe,P@ssw0rd!,EMS,EI


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
