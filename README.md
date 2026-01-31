# Personal Portfolio

This is a personal portfolio website built with Flutter. It's designed to be a single-page application that showcases your profile, projects, and skills.

## Live Demo

[My Portfolio](https://joshualopez.joshua-lopez-1fd.workers.dev/)

## Screenshots

| Mobile | Desktop |
| --- | --- |
| ![Mobile Screenshot](https://via.placeholder.com/300x600.png?text=Mobile+Screenshot) | ![Desktop Screenshot](https://via.placeholder.com/800x600.png?text=Desktop+Screenshot) |

## Features

*   **Single-Page Layout**: A smooth, single-page experience with scrolling navigation.
*   **Responsive Design**: The layout adapts to different screen sizes, from mobile to desktop.
*   **Localization**: The content is available in English and Spanish.
*   **Hero Section**: A welcoming hero section with an animated title.
*   **Projects Section**: A grid of your projects with descriptions, tags, and links.
*   **Skills Section**: A list of your skills with corresponding icons.
*   **Contact Section**: A footer with your contact information and a button to send an email.
*   **"Tech" Aesthetics**: A cool, modern design with a grid background and the JetBrains Mono font.

## Technologies Used

*   **Flutter**: The UI toolkit for building the application.
*   **Dart**: The programming language used for Flutter development.
*   **google_fonts**: For using custom fonts from Google Fonts.
*   **animated_text_kit**: For creating text animations.
*   **font_awesome_flutter**: For using Font Awesome icons.
*   **url_launcher**: For launching URLs (used for project links and email).
*   **youtube_player_iframe**: For embedding YouTube videos.
*   **flutter_localizations**: For handling localization.
*   **intl**: For internationalization and formatting.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/your_project.git
    ```
2.  Install packages
    ```sh
    flutter pub get
    ```
3.  Run the app
    ```sh
    flutter run
    ```

## Configuration

All the data in this portfolio is loaded from local data sources. You can easily change the content by editing the following files:

### Profile

To change your name and email, edit the `getProfile` method in `lib/features/profile/data/datasources/profile_local_data_source.dart`:

```dart
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // I simulate a delay or database call
    await Future.delayed(const Duration(milliseconds: 100));
    return ProfileModel(
      name: 'Your Name',
      email: 'your.email@example.com',
    );
  }
}
```

### Projects

To add, remove, or edit projects, modify the `getProjects` method in `lib/features/projects/data/datasources/project_local_data_source.dart`. The projects are available in English and Spanish.

```dart
class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects(String lang) async {
    // ...
    if (lang == 'es') {
      return const [
        ProjectModel(
          title: 'My Project in Spanish',
          description: 'Description in Spanish.',
          tags: ['Flutter', 'Dart'],
          githubUrl: 'https://github.com',
        ),
      ];
    }

    // Default to English
    return const [
      ProjectModel(
        title: 'My Project in English',
        description: 'Description in English.',
        tags: ['Flutter', 'Dart'],
        githubUrl: 'https://github.com',
      ),
    ];
  }
}
```

### Skills

To change the skills list, edit the `getSkills` method in `lib/features/skills/data/datasources/skill_local_data_source.dart`:

```dart
class SkillLocalDataSourceImpl implements SkillLocalDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    // ...
    return const [
      SkillModel(name: 'Flutter / Dart', iconCode: 'flutter'),
      SkillModel(name: 'Unity / C#', iconCode: 'unity'),
      // ...
    ];
  }
}
```

## Localization

This project uses the `flutter_localizations` package for localization. The localization files are located in the `lib/l10n` directory.

*   `app_en.arb`: English translations
*   `app_es.arb`: Spanish translations

To add a new language:

1.  Create a new `.arb` file in the `lib/l10n` directory (e.g., `app_fr.arb` for French).
2.  Add the new locale to the `l10n.yaml` file.
3.  Run `flutter gen-l10n` to generate the new localization files.
4.  Update the `supportedLocales` list in `lib/main.dart`.

## License

Distributed under the MIT License. See `LICENSE` for more information.