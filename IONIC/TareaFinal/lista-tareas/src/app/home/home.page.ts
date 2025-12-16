import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';

interface Tarea {
  texto: string;
  completada: boolean;
}

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [IonicModule, CommonModule, FormsModule],
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  nuevaTarea: string = '';
  tareas: Tarea[] = [];

  agregarTarea() {
    if (this.nuevaTarea.trim() === '') {
      return;
    }

    this.tareas.push({
      texto: this.nuevaTarea,
      completada: false
    });

    this.nuevaTarea = '';
  }

  eliminarTarea(index: number) {
    this.tareas.splice(index, 1);
  }
}