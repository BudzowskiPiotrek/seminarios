from django.core.management.base import BaseCommand
from blog.models import Pelicula
from datetime import date

class Command(BaseCommand):
    help = 'Crea 10 peliculas por defecto'

    def handle(self, *args, **kwargs):
        peliculas = [
            {'titulo': 'El Padrino', 'fecha_lanzamiento': date(1972, 3, 24), 'director': 'Francis Ford Coppola'},
            {'titulo': 'El Caballero Oscuro', 'fecha_lanzamiento': date(2008, 7, 18), 'director': 'Christopher Nolan'},
            {'titulo': 'Pulp Fiction', 'fecha_lanzamiento': date(1994, 10, 14), 'director': 'Quentin Tarantino'},
            {'titulo': 'El Señor de los Anillos: El Retorno del Rey', 'fecha_lanzamiento': date(2003, 12, 17), 'director': 'Peter Jackson'},
            {'titulo': 'Forrest Gump', 'fecha_lanzamiento': date(1994, 7, 6), 'director': 'Robert Zemeckis'},
            {'titulo': 'Origen', 'fecha_lanzamiento': date(2010, 7, 16), 'director': 'Christopher Nolan'},
            {'titulo': 'Matrix', 'fecha_lanzamiento': date(1999, 3, 31), 'director': 'Lana Wachowski, Lilly Wachowski'},
            {'titulo': 'Uno de los Nuestros', 'fecha_lanzamiento': date(1990, 9, 19), 'director': 'Martin Scorsese'},
            {'titulo': 'Seven', 'fecha_lanzamiento': date(1995, 9, 22), 'director': 'David Fincher'},
            {'titulo': 'El Silencio de los Corderos', 'fecha_lanzamiento': date(1991, 2, 14), 'director': 'Jonathan Demme'},
        ]

        for p in peliculas:
            Pelicula.objects.get_or_create(
                titulo=p['titulo'],
                defaults={
                    'fecha_lanzamiento': p['fecha_lanzamiento'],
                    'director': p['director']
                }
            )
            
        self.stdout.write(self.style.SUCCESS('Peliculas creadas correctamente'))
