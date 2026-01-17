// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String greeting(Object name) {
    return '> Hello, I am ${name}_';
  }

  @override
  String get roleBackend => 'Backend Developer';

  @override
  String get roleSystems => 'Systems Architect';

  @override
  String get roleTech => 'Tech Enthusiast';

  @override
  String get introText =>
      'Crafting robust systems and elegant code.\nFocusing on scalability, performance, and clean architecture.';

  @override
  String get viewProjects => 'View Projects';

  @override
  String get selectedProjects => 'Selected Projects';

  @override
  String get techStack => 'Tech Stack';

  @override
  String footerText(Object name) {
    return '© 2026 $name. Built with Flutter & Coffee.';
  }

  @override
  String get navProjects => 'Projects';

  @override
  String get navSkills => 'Skills';

  @override
  String get navContact => 'Contact';

  @override
  String get projectNeuralTitle => 'Neural Network Viz';

  @override
  String get projectNeuralDesc =>
      'A 3D visualization tool for neural network architectures using WebGL and Python.';

  @override
  String get projectChatTitle => 'Distributed Chat';

  @override
  String get projectChatDesc =>
      'Scalable real-time chat application built with Go and gRPC, handling 10k+ concurrent connections.';

  @override
  String get projectBotTitle => 'Crypto Trading Bot';

  @override
  String get projectBotDesc =>
      'Automated trading algorithm interacting with multiple exchanges via WebSocket APIs.';

  @override
  String get projectPortfolioTitle => 'Portfolio V1';

  @override
  String get projectPortfolioDesc =>
      'My previous portfolio site built with React and Tailwind CSS.';

  @override
  String get contactMsg => 'Have a project in mind or just want to say hi?';
}
