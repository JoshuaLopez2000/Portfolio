// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String greeting(Object name) {
    return '$name';
  }

  @override
  String get heroBadge => 'UNAM Computer Engineering · Mexico · EN / ES';

  @override
  String get heroHeadline => 'Software, Mobile & XR Developer';

  @override
  String get roleMobile => 'Mobile Developer';

  @override
  String get roleSoftware => 'Software Engineer';

  @override
  String get roleGames => 'Game Developer';

  @override
  String get introText =>
      'I build cross-platform Flutter products, interactive 3D simulations, and AR/VR experiences with a focus on clean architecture, visual polish, and reliable delivery.';

  @override
  String get viewProjects => 'View Projects';

  @override
  String get contactMe => 'Get in Touch';

  @override
  String get heroCardTitle => 'At a glance';

  @override
  String get heroFocus1Title => 'Mobile & Web Products';

  @override
  String get heroFocus1Subtitle =>
      'Flutter, Dart, responsive UI & clean architecture';

  @override
  String get heroFocus2Title => 'Interactive 3D, VR & AR';

  @override
  String get heroFocus2Subtitle =>
      'Unity, C#, Vuforia, standalone VR & shaders';

  @override
  String get heroFocus3Title => 'Backend & Delivery';

  @override
  String get heroFocus3Subtitle =>
      'REST APIs, SQL, Docker, Linux & cloud deploys';

  @override
  String get projectsEyebrow => '01 · SELECTED WORK';

  @override
  String get selectedProjects => 'Selected Projects';

  @override
  String get projectsSubtitle =>
      'Production collaborations, XR prototypes, and cross-platform apps with live previews.';

  @override
  String get skillsEyebrow => '02 · CAPABILITIES';

  @override
  String get techStack => 'Tech Stack';

  @override
  String get skillsSubtitle =>
      'Core technologies across mobile engineering, interactive 3D/XR, and infrastructure.';

  @override
  String get skillCategoryMobile => 'Mobile & Web';

  @override
  String get skillCategoryInteractive => 'Games & XR (AR / VR)';

  @override
  String get skillCategoryBackend => 'Backend, Cloud & Tools';

  @override
  String get contactEyebrow => '03 · CONTACT';

  @override
  String get contactMsg =>
      'Open to software, Flutter, and Unity/XR opportunities. Let\'s talk about your next project.';

  @override
  String footerText(Object name) {
    return '© 2026 $name. Built with Flutter.';
  }

  @override
  String get navProjects => 'Projects';

  @override
  String get navSkills => 'Skills';

  @override
  String get navContact => 'Contact';

  @override
  String get actionCode => 'Code';

  @override
  String get actionDemo => 'Live';

  @override
  String get actionVideo => 'Video';
}
