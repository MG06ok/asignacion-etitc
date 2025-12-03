# Sistema de Gestión - ETITC
Descripción del Proyecto
Sistema web desarrollado en PHP para la gestión de asignación de aulas, docentes y grupos de estudiantes en la Escuela Tecnológica Instituto Técnico Central (ETITC). Permite administrar recursos educativos, programar clases y visualizar cronogramas de manera eficiente.

🚀 Características Principales
- Gestión de Usuarios: Registro y autenticación con correos institucionales
- Administración de Aulas: Registro de aulas con capacidad y elementos disponibles
- Gestión de Docentes: Registro de docentes con sus horarios y asignaturas
- Control de Grupos: Organización de estudiantes por nivel educativo (Básica/Superior)
- Asignación de Clases: Sistema para asignar clases considerando disponibilidad de recursos
- Cronogramas Interactivos: Visualización de asignaciones por tipo de educación
- Interfaz Responsive: Diseño adaptable a diferentes dispositivos


🛠️ Tecnologías Utilizadas
- Backend: PHP 7.4+, MySQL
- Frontend: HTML5, CSS3, JavaScript, Bootstrap 5.3
- Librerías:
  - SweetAlert2 para notificaciones
  - Font Awesome para iconos
  - IntlDateFormatter para formatos de fecha
  - Seguridad: Password hashing, prepared statements, validación de inputs


📁 Estructura del Proyecto

asignador-etitc/
│
├── app/
│   ├── config.php              # Configuración de base de datos
│   ├── controllers/
│   │   ├── login/              # Controladores de autenticación
│   │   ├── register/           # Controladores de registro
│   │   ├── aula/               # Controladores de aulas
│   │   ├── docente/            # Controladores de docentes
│   │   ├── estudiantes/        # Controladores de grupos
│   │   └── asignacion_clase/   # Controladores de asignaciones
│   └── ...
│
├── images/                     # Recursos gráficos
│   ├── fondo_etitc.jpg
│   ├── logo-etitc.png
│   ├── chicas.jpg
│   ├── etitc.jpg
│   ├── personas_etitc.jpg
│   └── ...
│
├── includes/                   # Componentes reutilizables
│   ├── head.php
│   ├── navbar.php
│   └── ...
│
├── layout/                     # Layout y sesiones
│   └── sesion.php
│
├── index.php                   # Página principal (asignación de clases)
├── login.php                   # Inicio de sesión
├── register.php                # Registro de usuarios
├── asignaciones.php            # Cronogramas de asignación
├── aulas.php                   # Listado de aulas
├── docentes.php                # Listado de docentes
├── estudiantes.php             # Vista de grupos
├── edbasica.php                # Grupos educación básica
├── edsuperior.php              # Grupos educación superior
├── registrar.php               # Menú de registro
├── aregistro.php               # Registro de aulas
├── dregistro.php               # Registro de docentes
├── eregistro.php               # Registro de grupos
└── README.md                   # Este archivo
