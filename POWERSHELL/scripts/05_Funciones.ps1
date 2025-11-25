# Listar los 10 procesos que más CPU están consumiendo
function Get-TopProcesses {
    param($Cantidad = 5)
    Get-Process | Sort-Object CPU -Descending | Select-Object -First $Cantidad
}

Get-TopProcesses 10


