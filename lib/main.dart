import 'package:flutter/material.dart';
import 'presentation/screens/home_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MiPortfolioApp());
}

class MiPortfolioApp extends StatefulWidget {
  const MiPortfolioApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MiPortfolioAppState? state = context.findAncestorStateOfType<_MiPortfolioAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MiPortfolioApp> createState() => _MiPortfolioAppState();
}

class _MiPortfolioAppState extends State<MiPortfolioApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Presentación',
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
