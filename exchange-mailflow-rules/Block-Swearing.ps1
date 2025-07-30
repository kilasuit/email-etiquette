# Install module if needed
Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser

# Connect to Exchange Online
Connect-ExchangeOnline -UserPrincipalName your_admin_account@domain.com

$ruleParams = @{
    Name = "Block Offensive Language with Exceptions"
    SubjectOrBodyContainsWords  = @(
        "wtaf", "WTAF", "Wtaf",
        "fuck", "shit", "cunt",
        "bitch", "slut", "wanker",
        "bastard", "bellend", "shitcunt"
    )
    ExceptIfAnyOfToHeader       = @(
        "your_email@domain.com", "trusted.user@domain.com"
    )
    RejectMessageReasonText     = "Your message was blocked due to inappropriate content."
    SenderNotificationEnabled   = $true
}

New-TransportRule @ruleParams
