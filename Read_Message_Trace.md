Trace Email in Exchange Server
This PowerShell script traces an email in Exchange Server using the Message Tracking Log.

Prerequisites
Before running this script, make sure you have the following:

Access to an Exchange Server with the necessary permissions to run this script
Windows PowerShell version 2.0 or later installed on your computer
Usage
Open Windows PowerShell on your computer.
Copy and paste the script into the PowerShell prompt.
Replace ExchangeServerFQDN with your Exchange Server fully qualified domain name.
Replace Enter Message ID Here with the ID of the email you want to trace.
Press Enter to run the script.
The script will connect to the Exchange Server, trace the email using the specified message ID, and display the results in a table format.

Output
The script will output the following details for the traced email:

Timestamp: The date and time the email was sent
Sender: The email address of the sender
Recipients: The email addresses of the recipients
MessageSubject: The subject line of the email
EventId: A unique event ID for the message tracking log event
Source: The source of the event
RecipientStatus: The status of the recipient
Notes
If the email was sent from an external email address, the script will only be able to trace it if the Exchange Server is configured to allow external tracking.
Make sure you have appropriate permissions to run this script.
