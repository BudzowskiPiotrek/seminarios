try {
    Get-Item "C:\archivo_inexistente.txt"
}
catch {
    Write-Host "Error: No se encontró el archivo" 
}
finally {
    Write-Host "Ejecución finalizada"
}
<#
try {
    Get-Item 'C:\archivo_inexistente.txt' -ErrorAction Stop
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
}
finally {
    Write-Host "Ejecución finalizada"
}#>

#$contraseña_texto = Read-Host "Introduce tu contraseña" -MaskInput
#Write-Host "Contraseña recibida."

# Crea un script que pida un número y diga si es mayor o menor que 100:
$numero = Read-Host "Introduce un número"
if ($numero -gt 100) {
    Write-Host "El número es mayor que 100."
} elseif ($numero -lt 100) {
    Write-Host "El número es menor que 100."
} else {
    Write-Host "El número es igual a 100."
}