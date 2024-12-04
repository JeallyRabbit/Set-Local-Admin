# Function to check if the script is running as Administrator
function Is-RunAsAdministrator {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Check if the script is running as Administrator
if (-not (Is-RunAsAdministrator)) {
    Write-Host "This script is not running as Administrator. Restarting with elevated privileges..."
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Write-Host "Running with elevated privileges."

#Script continues here if running as Administrator

# Get the current logged-in username
Set-Variable -Name CurrentUser -Value $Env:UserName
#echo Current User: $CurrentUser
#Check if the current user is not "Administrator"
if ( $CurrentUser -ne "Administrator" ){ 
    
    
    #Enable the built-in Administrator account
    net user Administrator set /active:yes 
    Write-Host "Administrator account has been enabled."
    
    # Set a password for the Administrator account

    net user Administrator 'Password'
    Write-Host "Administrator password has been set."

#Disable-LocalUser $CurrentUser
    net user $CurrentUser set /active:no 
    Write-Host "Current user $CurrentUser has been disabled."

} else {
    Write-Host "You cannot disable the Administrator account."
}


Write-Host -NoNewLine "Press any key to continue..."
$null = Read-Host
logoff
exit