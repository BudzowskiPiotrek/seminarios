# ==== UN SOLO ZIP CON TODAS LAS CARPETAS ====
$ruta = "C:\xampp\mysql\data"
$destBase = "C:\Users\Julian\Desktop\OneDrive\2DAM\ProyectoIntermodular\00Powershell\reportsxampp"
$fecha = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$zipPath = Join-Path $destBase "todas_las_bases_$fecha.zip"

if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

# Coge todas las carpetas (puedes filtrar con Where-Object si quieres excluir alguna)
$dirs = (Get-ChildItem $ruta -Directory).FullName

# Comprime todas las carpetas dentro del zip
Compress-Archive -Path $dirs -DestinationPath $zipPath -CompressionLevel Optimal

Write-Host "ZIP creado: $zipPath"