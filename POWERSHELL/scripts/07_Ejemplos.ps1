
# Comprobar el estado del firewall de Windows #
#Get-NetFirewallProfile | Select-Object Name, Enabled

# Listar dispositivos USB conectados #
#Get-CimInstance Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'USB' } |
#Select-Object Name, DeviceID, Manufacturer

# Listar adaptadores de red activos #
#Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } |
#Select-Object Name, InterfaceDescription, MacAddress, LinkSpeed

# Listar servicios de Windows que están detenidos #
#Get-Service | Where-Object { $_.Status -eq 'Stopped' } |
#Select-Object Name, DisplayName, Status

# Listar usuarios locales del sistema #
#Get-LocalUser | Select-Object Name, Enabled, LastLogon

# Crear un nuevo usuario local sin contraseña #
#New-LocalUser -Name "NuevoUsuario" -NoPassword -FullName "Usuario de Prueba" -Description "Cuenta creada para pruebas"

# Listar tareas programadas en el sistema #
Get-ScheduledTask | Select-Object TaskName, State, LastRunTime, Next

# Crear nueva tarea programada que ejecute un script diario #
#$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File 'C:\ruta\al\script.ps1'"
#$trigger = New-ScheduledTaskTrigger -Daily -At 8am
#Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "TareaDiariaScript" -Description "Ejecuta un script de PowerShell diariamente a las 8 AM"


#Probar conectividad a un sitio web
#Test-Connection -ComputerName google.com -Count 4
#Test-NetConnection -ComputerName google.com -Port 443
