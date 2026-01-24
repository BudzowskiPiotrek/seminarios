from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator

class Pelicula(models.Model):
    titulo = models.CharField(max_length=200)
    fecha_lanzamiento = models.DateField()
    director = models.CharField(max_length=200)

    def __str__(self):
        return self.titulo

class Resena(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    pelicula = models.ForeignKey(Pelicula, on_delete=models.CASCADE)
    fecha_visualizacion = models.DateField()
    valoracion = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(10)]
    )
    comentario = models.TextField()
    fecha_creacion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.usuario.username} - {self.pelicula.titulo}"
