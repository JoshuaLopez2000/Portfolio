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
  /// **'{name}'**
  String greeting(Object name);

  /// No description provided for @heroBadge.
  ///
  /// In en, this message translates to:
  /// **'B.S. Computer Engineering (UNAM) · Mexico City · EN / ES'**
  String get heroBadge;

  /// No description provided for @heroHeadline.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer · Flutter, Go & Unity XR'**
  String get heroHeadline;

  /// No description provided for @roleMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer'**
  String get roleMobile;

  /// No description provided for @roleSoftware.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer'**
  String get roleSoftware;

  /// No description provided for @roleGames.
  ///
  /// In en, this message translates to:
  /// **'Game Developer'**
  String get roleGames;

  /// No description provided for @introText.
  ///
  /// In en, this message translates to:
  /// **'Computer Engineer building production cross-platform Flutter apps, Go/Node.js REST APIs with SQL persistence, and interactive Unity XR simulations — focused on maintainable code and measurable performance gains.'**
  String get introText;

  /// No description provided for @viewProjects.
  ///
  /// In en, this message translates to:
  /// **'View Projects'**
  String get viewProjects;

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCv;

  /// No description provided for @contactMe.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactMe;

  /// No description provided for @copyEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy email'**
  String get copyEmail;

  /// No description provided for @emailCopied.
  ///
  /// In en, this message translates to:
  /// **'Email copied'**
  String get emailCopied;

  /// No description provided for @heroCardTitle.
  ///
  /// In en, this message translates to:
  /// **'At a glance'**
  String get heroCardTitle;

  /// No description provided for @heroFocus1Title.
  ///
  /// In en, this message translates to:
  /// **'Production Flutter & Mobile'**
  String get heroFocus1Title;

  /// No description provided for @heroFocus1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Android, iOS & Web · ~20% faster load times · Play Store & App Store'**
  String get heroFocus1Subtitle;

  /// No description provided for @heroFocus2Title.
  ///
  /// In en, this message translates to:
  /// **'Backend APIs & SQL'**
  String get heroFocus2Title;

  /// No description provided for @heroFocus2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Go, Node.js, Python, JWT, PostgreSQL · up to 40% faster processing'**
  String get heroFocus2Subtitle;

  /// No description provided for @heroFocus3Title.
  ///
  /// In en, this message translates to:
  /// **'Unity 6, VR & AR'**
  String get heroFocus3Title;

  /// No description provided for @heroFocus3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Meta Quest, OpenXR, Vuforia, shaders & testable C# architecture'**
  String get heroFocus3Subtitle;

  /// No description provided for @projectsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'01 · SELECTED WORK'**
  String get projectsEyebrow;

  /// No description provided for @selectedProjects.
  ///
  /// In en, this message translates to:
  /// **'Selected Projects'**
  String get selectedProjects;

  /// No description provided for @projectsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Full-stack Flutter + Go engineering, VR training systems, and interactive mobile apps. Open any card for the full case study.'**
  String get projectsSubtitle;

  /// No description provided for @experienceEyebrow.
  ///
  /// In en, this message translates to:
  /// **'02 · TRACK RECORD'**
  String get experienceEyebrow;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience & Education'**
  String get experienceTitle;

  /// No description provided for @experienceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Production mobile apps, VR simulation engineering, QA discipline, and UNAM Computer Engineering foundation.'**
  String get experienceSubtitle;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education & Languages'**
  String get educationTitle;

  /// No description provided for @skillsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'03 · CAPABILITIES'**
  String get skillsEyebrow;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack'**
  String get techStack;

  /// No description provided for @skillsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technologies backed by shipped mobile apps, backend APIs, and XR simulations.'**
  String get skillsSubtitle;

  /// No description provided for @skillCategoryMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile & Web'**
  String get skillCategoryMobile;

  /// No description provided for @skillCategoryInteractive.
  ///
  /// In en, this message translates to:
  /// **'Unity & XR (VR / AR)'**
  String get skillCategoryInteractive;

  /// No description provided for @skillCategoryBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend, Data & Delivery'**
  String get skillCategoryBackend;

  /// No description provided for @contactEyebrow.
  ///
  /// In en, this message translates to:
  /// **'04 · CONTACT'**
  String get contactEyebrow;

  /// No description provided for @contactMsg.
  ///
  /// In en, this message translates to:
  /// **'Open to Flutter, Full-Stack (Go/Node/SQL), and Unity/XR roles. Reach out directly or copy my email in one click.'**
  String get contactMsg;

  /// No description provided for @footerText.
  ///
  /// In en, this message translates to:
  /// **'© 2026 {name}. Built with Flutter.'**
  String footerText(Object name);

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

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

  /// No description provided for @actionCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get actionCode;

  /// No description provided for @actionDemo.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get actionDemo;

  /// No description provided for @actionVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get actionVideo;

  /// No description provided for @actionCaseStudy.
  ///
  /// In en, this message translates to:
  /// **'Case study'**
  String get actionCaseStudy;

  /// No description provided for @caseStudyProblem.
  ///
  /// In en, this message translates to:
  /// **'Context & Challenge'**
  String get caseStudyProblem;

  /// No description provided for @caseStudySolution.
  ///
  /// In en, this message translates to:
  /// **'Architecture & Solution'**
  String get caseStudySolution;

  /// No description provided for @caseStudyHighlights.
  ///
  /// In en, this message translates to:
  /// **'Technical Highlights'**
  String get caseStudyHighlights;

  /// No description provided for @caseStudyImpact.
  ///
  /// In en, this message translates to:
  /// **'Outcome & Impact'**
  String get caseStudyImpact;

  /// No description provided for @caseStudyRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get caseStudyRole;
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
