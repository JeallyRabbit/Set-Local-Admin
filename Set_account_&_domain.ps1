echo "------------------------------------------Ustawianie konta lokalnego administratora-----------------------------------------"
$password = Read-Host -AsSecureString "Podaj haslo lokalnego admina"
net user Administrator $password
Disable-LocalUser $username
echo "-----------------Wylaczono obecnie zalogowane lokalne konto oraz uruchomiono konto lokalnego administratora-----------------"

echo "------------------------------------------Dodawanie komputera do domeny C4CR.LOCAL------------------------------------------"
$name = Read-Host "Podaj nowa nazwe komputera"
Rename-Computer -NewName $name
Add-computer -DomainName C4CR.LOCAL

echo "--------------------------------------------------------KONIEC ZABAWY-------------------------------------------------------"