# Connect to Exchange Server
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://ExchangeServerFQDN/PowerShell/ -Authentication Kerberos
Import-PSSession $Session

# Set the message ID of the email you want to trace
$MessageID = "Enter Message ID Here"

# Trace the email
Get-MessageTrackingLog -MessageId $MessageID -ResultSize Unlimited | Select-Object Timestamp,Sender,Recipients,MessageSubject,EventId,Source,RecipientStatus | Format-Table -Autosize

# Disconnect from Exchange Server
Remove-PSSession $Session
