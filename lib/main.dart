import 'package:flutter/material.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';

import 'injection_container.dart';
import 'l10n/app_localizations.dart';
import 'presentation/screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.init();
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

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${widget.profile.name} — Portfolio',
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      home: HomeScreen(profile: widget.profile),
    );
  }
}
