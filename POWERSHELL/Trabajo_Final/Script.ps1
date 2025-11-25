function Get-SystemInfo {
    # --- 1. Obtener la info pal papi Julian ---
    $fecha = Get-Date
    $usuario = $env:USERNAME
    $procesos = Get-Process | Sort-Object CPU -Descending | Select-Object -First 5

    # --- 2. Definir la ruta pal papi Julian ---
    # --- te la guardara donde arancaraste el script
    $ruta = "$PSScriptRoot\Reporte-Sistema.txt"

    # --- 3. Oh yeah ---
    $contenido = @()
    $contenido += "===== Fecha y Hora Actual ====="
    $contenido += $fecha
    $contenido += ""
    $contenido += "===== Usuario Actual ====="
    $contenido += $usuario
    $contenido += ""
    $contenido += "===== Top 5 Procesos por CPU ====="
    $contenido += ($procesos | Format-Table -AutoSize | Out-String)

    # --- 6. Guardar ---
    $contenido | Out-File -FilePath $ruta -Encoding UTF8

    Write-Host "Reporte generado en: $ruta"
}

Get-SystemInfo
#              ________________________________
#             |                                |
#             |     ┌─────────────────────┐    |
#             |     │     SYSTEM INFO     │    |
#             |     └─────────────────────┘    |
#             |        (  -_– )                |
#             |      ___/|___|\___             |
#             |     |   Computadora |          |
#             |     |_______________|          |
#             |        ||       ||             |
#             |        ||       ||             |
#             |        []       []             |
#             |________________________________|

# --- Nota: Si la tarea está programada ya en el Administrador de Tareas y el equipo está caput 
# --- o porque sugan nos dejo sin luz, simplemente no se ejecuta en ese momento a menos que la opción de
# --- "reactivar el equipo" esté habilitada.


