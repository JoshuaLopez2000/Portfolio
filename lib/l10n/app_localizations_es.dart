// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String greeting(Object name) {
    return '$name';
  }

  @override
  String get heroBadge => 'Ing. en Computación UNAM · México · ES / EN';

  @override
  String get heroHeadline => 'Desarrollador de Software, Móvil y XR';

  @override
  String get roleMobile => 'Desarrollador Móvil';

  @override
  String get roleSoftware => 'Ingeniero de Software';

  @override
  String get roleGames => 'Desarrollador de Videojuegos';

  @override
  String get introText =>
      'Creo productos multiplataforma en Flutter, simuladores interactivos 3D y experiencias AR/VR con enfoque en arquitectura limpia, rendimiento y calidad de producto.';

  @override
  String get viewProjects => 'Ver Proyectos';

  @override
  String get contactMe => 'Contactar';

  @override
  String get heroCardTitle => 'En resumen';

  @override
  String get heroFocus1Title => 'Productos Móviles y Web';

  @override
  String get heroFocus1Subtitle =>
      'Flutter, Dart, UI responsiva y arquitectura limpia';

  @override
  String get heroFocus2Title => '3D Interactivo, VR y AR';

  @override
  String get heroFocus2Subtitle => 'Unity, C#, Vuforia, VR autónomo y shaders';

  @override
  String get heroFocus3Title => 'Backend y Despliegue';

  @override
  String get heroFocus3Subtitle =>
      'APIs REST, SQL, Docker, Linux y despliegues cloud';

  @override
  String get projectsEyebrow => '01 · PROYECTOS DESTACADOS';

  @override
  String get selectedProjects => 'Proyectos Seleccionados';

  @override
  String get projectsSubtitle =>
      'Colaboraciones profesionales, prototipos XR y aplicaciones multiplataforma con vista previa.';

  @override
  String get skillsEyebrow => '02 · CAPACIDADES';

  @override
  String get techStack => 'Stack Tecnológico';

  @override
  String get skillsSubtitle =>
      'Tecnologías principales en desarrollo móvil, 3D/XR interactivo e infraestructura.';

  @override
  String get skillCategoryMobile => 'Móvil y Web';

  @override
  String get skillCategoryInteractive => 'Videojuegos y XR (AR / VR)';

  @override
  String get skillCategoryBackend => 'Backend, Cloud y Herramientas';

  @override
  String get contactEyebrow => '03 · CONTACTO';

  @override
  String get contactMsg =>
      'Disponible para oportunidades en software, Flutter y Unity/XR. Hablemos sobre tu próximo proyecto.';

  @override
  String footerText(Object name) {
    return '© 2026 $name. Desarrollado con Flutter.';
  }

  @override
  String get navProjects => 'Proyectos';

  @override
  String get navSkills => 'Habilidades';

  @override
  String get navContact => 'Contacto';

  @override
  String get actionCode => 'Código';

  @override
  String get actionDemo => 'Demo';

  @override
  String get actionVideo => 'Video';
}
