# Personal Portfolio ✨

**Single-page portfolio website built with Flutter**, designed, developed and deployed as a web app on Cloudflare Workers.

> Portafolio personal de una sola página construido con **Flutter** y desplegado como web app. Contenido disponible en **inglés y español**.

## 🌐 Live demo / Demo en línea

[https://joshualopez.joshua-lopez-1fd.workers.dev/](https://joshualopez.joshua-lopez-1fd.workers.dev/)

## 📸 Screenshots

> 🚧 Real screenshots coming soon — desktop and mobile versions.
> (Capturas reales pendientes; se recomienda reemplazar esta nota con GIFs de la versión móvil y de escritorio.)

## ✨ Features

- **Single-page layout** — smooth scrolling navigation across sections.
- **Responsive design** — adapts from mobile to desktop.
- **Localization** — full content in English and Spanish (i18n).
- **Hero section** — welcoming hero with animated title.
- **Projects section** — grid of projects with descriptions, tags and links.
- **Skills section** — skill list with icons.
- **Contact section** — contact info with a direct email button.
- **"Tech" aesthetics** — modern design with a grid background and JetBrains Mono font.

## 🛠 Technologies used

| Tech | Purpose |
| --- | --- |
| [Flutter](https://flutter.dev/) | UI toolkit |
| Dart | Programming language |
| `google_fonts` | Custom fonts |
| `animated_text_kit` | Text animations |
| `font_awesome_flutter` | Icons |
| `url_launcher` | Launching URLs / email |
| `youtube_player_iframe` | Embedding YouTube videos |
| `flutter_localizations` + `intl` | Internationalization |

## 🚀 Getting started

```sh
git clone https://github.com/JoshuaLopez2000/Portfolio.git
cd Portfolio
flutter pub get
flutter run
```

## ⚙️ Customizing content

All portfolio data is loaded from local data sources, so the site can be repurposed just by editing one file:

- **Profile** (name, email) → `getProfile` in `lib/features/profile/data/datasources/profile_local_data_source.dart`
- **Projects** (titles, descriptions, tags, URLs) → `getProjects` in `lib/features/projects/data/datasources/project_local_data_source.dart`
- **Skills** → `getSkills` in `lib/features/skills/data/datasources/skill_local_data_source.dart`

## 🌍 Localization

- `lib/l10n/app_en.arb` — English
- `lib/l10n/app_es.arb` — Spanish

To add a language: create `app_<locale>.arb` in `lib/l10n`, register the locale in `l10n.yaml` and `lib/main.dart`, then run `flutter gen-l10n`.

## 📄 License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.
