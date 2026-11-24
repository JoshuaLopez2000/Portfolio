// ignore_for_file: deprecated_member_use

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
  String get heroBadge => 'Ing. en Computación (UNAM) · CDMX, México · ES / EN';

  @override
  String get heroHeadline => 'Ingeniero de Software · Flutter, Go y Unity XR';

  @override
  String get roleMobile => 'Desarrollador Móvil';

  @override
  String get roleSoftware => 'Ingeniero de Software';

  @override
  String get roleGames => 'Desarrollador de Videojuegos';

  @override
  String get introText =>
      'Ingeniero en Computación enfocado en aplicaciones Flutter en producción (Android, iOS y Web), APIs REST en Go/Node.js con SQL y simuladores interactivos en Unity XR, con mejoras medibles en rendimiento y entrega punta a punta.';

  @override
  String get viewProjects => 'Ver Proyectos';

  @override
  String get downloadCv => 'Descargar CV';

  @override
  String get contactMe => 'Contacto';

  @override
  String get copyEmail => 'Copiar correo';

  @override
  String get emailCopied => 'Correo copiado';

  @override
  String get heroCardTitle => 'En resumen';

  @override
  String get heroFocus1Title => 'Flutter y Móvil en Producción';

  @override
  String get heroFocus1Subtitle =>
      'Android, iOS y Web · ~20% menos carga · Play Store y App Store';

  @override
  String get heroFocus2Title => 'Backend, APIs y SQL';

  @override
  String get heroFocus2Subtitle =>
      'Go, Node.js, Python, JWT, PostgreSQL · hasta 40% en procesos';

  @override
  String get heroFocus3Title => 'Unity 6, VR y AR';

  @override
  String get heroFocus3Subtitle =>
      'Meta Quest, OpenXR, Vuforia, shaders y arquitectura C# testeable';

  @override
  String get projectsEyebrow => '01 · PROYECTOS DESTACADOS';

  @override
  String get selectedProjects => 'Proyectos Seleccionados';

  @override
  String get projectsSubtitle =>
      'Ingeniería full-stack en Flutter + Go, simuladores VR y apps interactivas. Abre cualquier tarjeta para ver el caso de estudio completo.';

  @override
  String get experienceEyebrow => '02 · TRAYECTORIA';

  @override
  String get experienceTitle => 'Experiencia y Educación';

  @override
  String get experienceSubtitle =>
      'Aplicaciones móviles en producción, simulación VR, QA multiplataforma y formación en Ingeniería en Computación (UNAM).';

  @override
  String get educationTitle => 'Educación e Idiomas';

  @override
  String get skillsEyebrow => '03 · CAPACIDADES';

  @override
  String get techStack => 'Stack Tecnológico';

  @override
  String get skillsSubtitle =>
      'Tecnologías respaldadas por aplicaciones en producción, APIs backend y simuladores XR.';

  @override
  String get skillCategoryMobile => 'Móvil y Web';

  @override
  String get skillCategoryInteractive => 'Unity y XR (VR / AR)';

  @override
  String get skillCategoryBackend => 'Backend, Datos y Entrega';

  @override
  String get contactEyebrow => '04 · CONTACTO';

  @override
  String get contactMsg =>
      'Disponible para roles en Flutter, Full-Stack (Go/Node/SQL) y Unity/XR. Escríbeme directamente o copia mi correo en un clic.';

  @override
  String footerText(Object name) {
    return '© 2026 $name. Desarrollado con Flutter.';
  }

  @override
  String get navProjects => 'Proyectos';

  @override
  String get navExperience => 'Experiencia';

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

  @override
  String get actionCaseStudy => 'Caso de estudio';

  @override
  String get caseStudyProblem => 'Contexto y Reto';

  @override
  String get caseStudySolution => 'Arquitectura y Solución';

  @override
  String get caseStudyHighlights => 'Aspectos Técnicos Clave';

  @override
  String get caseStudyImpact => 'Resultado e Impacto';

  @override
  String get caseStudyRole => 'Rol';
}
