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
  String get heroBadge =>
      'B.S. Computer Engineering (UNAM) · Mexico City · EN / ES';

  @override
  String get heroHeadline => 'Software Engineer · Flutter, Go & Unity XR';

  @override
  String get roleMobile => 'Mobile Developer';

  @override
  String get roleSoftware => 'Software Engineer';

  @override
  String get roleGames => 'Game Developer';

  @override
  String get introText =>
      'Computer Engineer building production cross-platform Flutter apps, Go/Node.js REST APIs with SQL persistence, and interactive Unity XR simulations — focused on maintainable code and measurable performance gains.';

  @override
  String get viewProjects => 'View Projects';

  @override
  String get downloadCv => 'Download CV';

  @override
  String get contactMe => 'Contact';

  @override
  String get copyEmail => 'Copy email';

  @override
  String get emailCopied => 'Email copied';

  @override
  String get heroCardTitle => 'At a glance';

  @override
  String get heroFocus1Title => 'Production Flutter & Mobile';

  @override
  String get heroFocus1Subtitle =>
      'Android, iOS & Web · ~20% faster load times · Play Store & App Store';

  @override
  String get heroFocus2Title => 'Backend APIs & SQL';

  @override
  String get heroFocus2Subtitle =>
      'Go, Node.js, Python, JWT, PostgreSQL · up to 40% faster processing';

  @override
  String get heroFocus3Title => 'Unity 6, VR & AR';

  @override
  String get heroFocus3Subtitle =>
      'Meta Quest, OpenXR, Vuforia, shaders & testable C# architecture';

  @override
  String get projectsEyebrow => '01 · SELECTED WORK';

  @override
  String get selectedProjects => 'Selected Projects';

  @override
  String get projectsSubtitle =>
      'Full-stack Flutter + Go engineering, VR training systems, and interactive mobile apps. Open any card for the full case study.';

  @override
  String get experienceEyebrow => '02 · TRACK RECORD';

  @override
  String get experienceTitle => 'Experience & Education';

  @override
  String get experienceSubtitle =>
      'Production mobile apps, VR simulation engineering, QA discipline, and UNAM Computer Engineering foundation.';

  @override
  String get educationTitle => 'Education & Languages';

  @override
  String get skillsEyebrow => '03 · CAPABILITIES';

  @override
  String get techStack => 'Tech Stack';

  @override
  String get skillsSubtitle =>
      'Technologies backed by shipped mobile apps, backend APIs, and XR simulations.';

  @override
  String get skillCategoryMobile => 'Mobile & Web';

  @override
  String get skillCategoryInteractive => 'Unity & XR (VR / AR)';

  @override
  String get skillCategoryBackend => 'Backend, Data & Delivery';

  @override
  String get contactEyebrow => '04 · CONTACT';

  @override
  String get contactMsg =>
      'Open to Flutter, Full-Stack (Go/Node/SQL), and Unity/XR roles. Reach out directly or copy my email in one click.';

  @override
  String footerText(Object name) {
    return '© 2026 $name. Built with Flutter.';
  }

  @override
  String get navProjects => 'Projects';

  @override
  String get navExperience => 'Experience';

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

  @override
  String get actionCaseStudy => 'Case study';

  @override
  String get caseStudyProblem => 'Context & Challenge';

  @override
  String get caseStudySolution => 'Architecture & Solution';

  @override
  String get caseStudyHighlights => 'Technical Highlights';

  @override
  String get caseStudyImpact => 'Outcome & Impact';

  @override
  String get caseStudyRole => 'Role';
}
