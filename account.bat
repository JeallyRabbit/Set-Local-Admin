@echo off
net user administrator $$AdminIT
net user administrator /active:yes
net user %username% /active:no
pause