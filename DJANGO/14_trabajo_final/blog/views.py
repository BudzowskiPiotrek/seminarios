from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.db.models import Avg
from .models import Pelicula, Resena
from .forms import ResenaForm

def inicio(request):
    peliculas = Pelicula.objects.all()
    return render(request, 'blog/inicio.html', {'peliculas': peliculas})

def registrar_usuario(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('inicio')
    else:
        form = UserCreationForm()
    return render(request, 'blog/registro.html', {'form': form})

def inicio_sesion(request):
    if request.method == 'POST':
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect('inicio')
    else:
        form = AuthenticationForm()
    return render(request, 'blog/login.html', {'form': form})

def cerrar_sesion(request):
    logout(request)
    return redirect('inicio')

@login_required
def mis_resenas(request):
    resenas = Resena.objects.filter(usuario=request.user).order_by('-fecha_creacion')
    return render(request, 'blog/mis_resenas.html', {'resenas': resenas})

@login_required
def crear_resena(request):
    if request.method == 'POST':
        form = ResenaForm(request.POST)
        if form.is_valid():
            resena = form.save(commit=False)
            resena.usuario = request.user
            resena.save()
            return redirect('mis_resenas')
    else:
        form = ResenaForm()
    return render(request, 'blog/crear_resena.html', {'form': form})

@login_required
def borrar_resena(request, resena_id):
    resena = get_object_or_404(Resena, id=resena_id, usuario=request.user)
    resena.delete()
    return redirect('mis_resenas')

def mejores_peliculas(request):
    peliculas = Pelicula.objects.annotate(promedio=Avg('resena__valoracion')).order_by('-promedio')
    return render(request, 'blog/mejores_peliculas.html', {'peliculas': peliculas})
