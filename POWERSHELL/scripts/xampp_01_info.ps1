# ==== REPORTE DE BASES DE DATOS ORDENADAS POR TAMAÑO ====
$ruta = "C:\xampp\mysql\data"
$reportPath = "C:\Users\Julian\Desktop\OneDrive\2DAM\ProyectoIntermodular\00Powershell\reportsxampp"

# Obtener solo carpetas (bases de datos)
$carpetas = Get-ChildItem $ruta -Directory

# Calcular el tamaño total de cada carpeta
$bases = foreach ($carpeta in $carpetas) {
    $tamano = (Get-ChildItem -Path $carpeta.FullName -Recurse -File -ErrorAction SilentlyContinue |
        Measure-Object Length -Sum).Sum
    [PSCustomObject]@{
        Nombre   = $carpeta.Name
        TamanoMB = [math]::Round(($tamano / 1MB), 2)
        Ruta     = $carpeta.FullName
    }
}

# Ordenar por tamaño descendente
$bases = $bases | Sort-Object TamanoMB -Descending

# Mostrar por pantalla
Write-Host "Bases de datos ordenadas por tamaño:`n"
$bases | Format-Table Nombre, TamanoMB -AutoSize

# Guardar el reporte
$fecha = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$archivo = Join-Path $reportPath "xampp_report_$fecha.txt"
$bases | Out-File $archivo

Write-Host "`nArchivo guardado en: $archivo"
Write-Host "Total de bases de datos: $($bases.Count)"
#=========================================#

