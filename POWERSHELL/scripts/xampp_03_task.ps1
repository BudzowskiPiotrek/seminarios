#Crear Task Programada para ejecutar el script xampp_02_zip.ps1 diariamente a las 9am
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File 'C:\Users\Julian\Desktop\OneDrive\2DAM\ProyectoIntermodular\00Powershell\scripts\xampp_02_zip.ps1'"
$trigger = New-ScheduledTaskTrigger -Daily -At 9 am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "BackupDiarioXAMPP"