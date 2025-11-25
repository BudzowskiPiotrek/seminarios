# Pedir tres números al usuario
#[int] fuerza la conversión a entero, si el usuario introduce algo no numérico, dará error directamente
[int]$num1 = Read-Host "Introduce el primer número"
[int]$num2 = Read-Host "Introduce el segundo número"
[int]$num3 = Read-Host "Introduce el tercer número"

# Guardarlos en un array
$numeros = @($num1, $num2, $num3)

# Calcular la suma
$suma = ($numeros | Measure-Object -Sum).Sum
Write-Host "La suma de los números es: $suma"

    
# Pedir el nombre al usuario y saludarlo
#$nombre = Read-Host "Introduce tu nombre"
#Write-Host "Hola, $nombre! Bienvenido a PowerShell."