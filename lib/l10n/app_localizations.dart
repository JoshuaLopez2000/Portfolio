import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'> Hello, I am {name}_'**
  String greeting(Object name);

  /// No description provided for @roleBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend Developer'**
  String get roleBackend;

  /// No description provided for @roleSystems.
  ///
  /// In en, this message translates to:
  /// **'Systems Architect'**
  String get roleSystems;

  /// No description provided for @roleTech.
  ///
  /// In en, this message translates to:
  /// **'Tech Enthusiast'**
  String get roleTech;

  /// No description provided for @introText.
  ///
  /// In en, this message translates to:
  /// **'Crafting robust systems and elegant code.\nFocusing on scalability, performance, and clean architecture.'**
  String get introText;

  /// No description provided for @viewProjects.
  ///
  /// In en, this message translates to:
  /// **'View Projects'**
  String get viewProjects;

  /// No description provided for @selectedProjects.
  ///
  /// In en, this message translates to:
  /// **'Selected Projects'**
  String get selectedProjects;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack'**
  String get techStack;

  /// No description provided for @footerText.
  ///
  /// In en, this message translates to:
  /// **'© 2026 {name}. Built with Flutter & Coffee.'**
  String footerText(Object name);

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @projectNeuralTitle.
  ///
  /// In en, this message translates to:
  /// **'Neural Network Viz'**
  String get projectNeuralTitle;

  /// No description provided for @projectNeuralDesc.
  ///
  /// In en, this message translates to:
  /// **'A 3D visualization tool for neural network architectures using WebGL and Python.'**
  String get projectNeuralDesc;

  /// No description provided for @projectChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Distributed Chat'**
  String get projectChatTitle;

  /// No description provided for @projectChatDesc.
  ///
  /// In en, this message translates to:
  /// **'Scalable real-time chat application built with Go and gRPC, handling 10k+ concurrent connections.'**
  String get projectChatDesc;

  /// No description provided for @projectBotTitle.
  ///
  /// In en, this message translates to:
  /// **'Crypto Trading Bot'**
  String get projectBotTitle;

  /// No description provided for @projectBotDesc.
  ///
  /// In en, this message translates to:
  /// **'Automated trading algorithm interacting with multiple exchanges via WebSocket APIs.'**
  String get projectBotDesc;

  /// No description provided for @projectPortfolioTitle.
  ///
  /// In en, this message translates to:
  /// **'Portfolio V1'**
  String get projectPortfolioTitle;

  /// No description provided for @projectPortfolioDesc.
  ///
  /// In en, this message translates to:
  /// **'My previous portfolio site built with React and Tailwind CSS.'**
  String get projectPortfolioDesc;

  /// No description provided for @contactMsg.
  ///
  /// In en, this message translates to:
  /// **'Have a project in mind or just want to say hi?'**
  String get contactMsg;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
