# Version: 1.0.0
# Last Updated: 28-Apr-2026
<#
    Solution: Self-Service Admin Account Unlock
    Description: Unlocks the mapped admin account for the currently authenticated standard user.
    Designed by: core365.cloud
    Website: https://core365.cloud

    Notes:
    - Intended for internal use only
    - Executed under controlled administrative permissions
    - Usage should comply with organizational security policies
#>

param(
    [string]$StandardUser
)

Import-Module ActiveDirectory

# Get standard user and admin mapping
$user = Get-ADUser $StandardUser -Properties extensionAttribute1

if (-not $user.extensionAttribute1) {
    Write-Error "No admin account mapped"
    exit 1
}

$adminAccount = $user.extensionAttribute1

# Unlock admin account
Unlock-ADAccount -Identity $adminAccount
