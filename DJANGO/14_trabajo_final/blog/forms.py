from django import forms
from .models import Resena

class ResenaForm(forms.ModelForm):
    class Meta:
        model = Resena
        fields = ['pelicula', 'fecha_visualizacion', 'valoracion', 'comentario']
        widgets = {
            'fecha_visualizacion': forms.DateInput(attrs={'type': 'date'}),
            'comentario': forms.Textarea(attrs={'rows': 3}),
        }
        labels = {
            'fecha_visualizacion': 'Fecha de visualización',
            'valoracion': 'Valoración (0-10)',
        }
