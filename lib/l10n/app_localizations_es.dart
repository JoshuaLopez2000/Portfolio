// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get greeting => '> Hola, soy Joshua_';

  @override
  String get roleBackend => 'Desarrollador Backend';

  @override
  String get roleSystems => 'Arquitecto de Sistemas';

  @override
  String get roleTech => 'Entusiasta Tecnológico';

  @override
  String get introText =>
      'Creando sistemas robustos y código elegante.\nEnfocado en escalabilidad, rendimiento y arquitectura limpia.';

  @override
  String get viewProjects => 'Ver Proyectos';

  @override
  String get selectedProjects => 'Proyectos Seleccionados';

  @override
  String get techStack => 'Stack Tecnológico';

  @override
  String get footerText => '© 2026 Joshua. Creado con Flutter y Café.';

  @override
  String get navProjects => 'Proyectos';

  @override
  String get navSkills => 'Habilidades';

  @override
  String get navContact => 'Contacto';

  @override
  String get projectNeuralTitle => 'Viz Red Neuronal';

  @override
  String get projectNeuralDesc =>
      'Herramienta de visualización 3D para arquitecturas de redes neuronales usando WebGL y Python.';

  @override
  String get projectChatTitle => 'Chat Distribuido';

  @override
  String get projectChatDesc =>
      'Aplicación de chat escalable en tiempo real construida con Go y gRPC, manejando 10k+ conexiones concurrentes.';

  @override
  String get projectBotTitle => 'Bot de Trading Cripto';

  @override
  String get projectBotDesc =>
      'Algoritmo de trading automatizado interactuando con múltiples exchanges vía WebSocket APIs.';

  @override
  String get projectPortfolioTitle => 'Portafolio V1';

  @override
  String get projectPortfolioDesc =>
      'Mi sitio de portafolio anterior construido con React y Tailwind CSS.';

  @override
  String get contactMsg =>
      '¿Tienes un proyecto en mente o solo quieres saludar?';
}
