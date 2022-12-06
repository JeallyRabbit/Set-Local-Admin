@echo off
echo Podaj haslo lokalnego admina
powershell -command "$password = Read-Host -AsSecureString"
powershell -command "net user Administrator $password"
powershell -command "Disable-LocalUser $username"
Pause
