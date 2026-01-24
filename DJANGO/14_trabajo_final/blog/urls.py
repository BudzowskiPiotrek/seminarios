from django.urls import path
from . import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('registro/', views.registrar_usuario, name='registro'),
    path('login/', views.inicio_sesion, name='login'),
    path('logout/', views.cerrar_sesion, name='logout'),
    path('mis-resenas/', views.mis_resenas, name='mis_resenas'),
    path('crear-resena/', views.crear_resena, name='crear_resena'),
    path('borrar-resena/<int:resena_id>/', views.borrar_resena, name='borrar_resena'),
    path('mejores-peliculas/', views.mejores_peliculas, name='mejores_peliculas'),
]
