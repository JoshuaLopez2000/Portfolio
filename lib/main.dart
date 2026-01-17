import 'package:flutter/material.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';

import 'injection_container.dart';
import 'l10n/app_localizations.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  // I ensure that the Flutter binding is initialized before doing anything else.
  WidgetsFlutterBinding.ensureInitialized();
  // I initialize the dependency injector.
  sl.init();
  // I load the user profile before running the app to have the data ready.
  final profile = await sl.getProfile();
  runApp(MiPortfolioApp(profile: profile));
}

class MiPortfolioApp extends StatefulWidget {
  final Profile profile;
  const MiPortfolioApp({super.key, required this.profile});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MiPortfolioAppState? state = context
        .findAncestorStateOfType<_MiPortfolioAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MiPortfolioApp> createState() => _MiPortfolioAppState();
}

class _MiPortfolioAppState extends State<MiPortfolioApp> {
  Locale? _locale;

  // I update the local state to change the application language.
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${widget.profile.name} Portfolio',
      locale: _locale,
      // I configure localization to support English and Spanish.
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      // I define a dark theme consistent with the 'hacker' or modern aesthetic I'm aiming for.
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: HomeScreen(profile: widget.profile),
    );
  }
}