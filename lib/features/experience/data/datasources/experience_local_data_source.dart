import '../../domain/entities/experience.dart';

abstract class ExperienceLocalDataSource {
  Future<ExperienceSummary> getExperience(String lang);
}

class ExperienceLocalDataSourceImpl implements ExperienceLocalDataSource {
  @override
  Future<ExperienceSummary> getExperience(String lang) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (lang == 'es') {
      return const ExperienceSummary(
        experiences: [
          ExperienceItem(
            role: 'Desarrollador de Software',
            company: 'Desarrollo Independiente',
            period: '2023 – Actualidad',
            location: 'México',
            isCurrent: true,
            highlights: [
              'Diseño y desarrollo aplicaciones multiplataforma en Flutter y Dart (Android, iOS y Web) integradas con servicios backend en Go, Python y Node.js.',
              'Implemento APIs REST, autenticación y persistencia en PostgreSQL y MySQL, optimizando procesos y consultas para reducir tiempos de ejecución hasta en 40 %.',
              'Desarrollo herramientas y prototipos interactivos en Unity y C# priorizando componentes reutilizables, rendimiento y experiencia de usuario.',
            ],
            tags: ['Flutter', 'Go', 'Python', 'Node.js', 'PostgreSQL', 'Unity'],
          ),
          ExperienceItem(
            role: 'Unity Developer / Software Engineer',
            company: 'Virtual Mind',
            period: '2026',
            location: 'México',
            highlights: [
              'Desarrollé simuladores de capacitación en realidad virtual con Unity y C# (Meta Quest, OpenXR), implementando lógica de interacción, seguimiento de usuario y componentes modulares reutilizables.',
              'Diagnostiqué y resolví incidencias de rendimiento y comportamiento funcional para garantizar experiencias interactivas estables.',
            ],
            tags: ['Unity 6', 'C#', 'Meta Quest', 'OpenXR', 'VR'],
          ),
          ExperienceItem(
            role: 'QA Tester',
            company: 'Lionbridge',
            period: '2026',
            location: 'México',
            highlights: [
              'Ejecuté pruebas funcionales y de regresión en múltiples plataformas, documentando defectos con evidencia reproducible y dando seguimiento a su corrección en el ciclo de desarrollo.',
            ],
            tags: ['QA', 'Pruebas Funcionales', 'Regresión', 'Multiplataforma'],
          ),
          ExperienceItem(
            role: 'Desarrollador Flutter',
            company: 'CAPDESIS',
            period: '2024 – 2025',
            location: 'México',
            highlights: [
              'Desarrollé y mantuve aplicaciones Flutter en producción para Android, iOS y Web, incluyendo CapMenu, Ingeniería Tracker y Formulae.',
              'Implementé lógica de negocio, consumo de APIs REST, autenticación JWT, persistencia local y soporte bilingüe; resolví incidencias de backend, CORS y compatibilidad multiplataforma.',
              'Reduje los tiempos de carga aproximadamente 20 % y apoyé la preparación y publicación de versiones en Google Play Console y App Store Connect.',
            ],
            tags: [
              'Flutter',
              'REST APIs',
              'JWT',
              'Google Play',
              'App Store Connect',
            ],
          ),
        ],
        education: [
          EducationItem(
            degree: 'Ingeniería en Computación',
            institution:
                'Universidad Nacional Autónoma de México (UNAM) — Facultad de Ingeniería',
            period: '2019 – 2025',
            location: 'Ciudad de México, México',
          ),
          EducationItem(
            degree: 'Diplomado en Desarrollo y Creación de Videojuegos',
            institution:
                'Universidad Nacional Autónoma de México (UNAM) — Facultad de Ingeniería',
            period: '2023 – 2024',
            location: 'Ciudad de México, México',
          ),
        ],
        spokenLanguages: 'Español (Nativo) · Inglés (Intermedio profesional)',
      );
    }

    return const ExperienceSummary(
      experiences: [
        ExperienceItem(
          role: 'Software Developer',
          company: 'Independent Software Development',
          period: '2023 – Present',
          location: 'Mexico',
          isCurrent: true,
          highlights: [
            'Design and build cross-platform Flutter and Dart applications (Android, iOS, Web) integrated with backend services in Go, Python, and Node.js.',
            'Implement REST APIs, authentication flows, and relational persistence (PostgreSQL, MySQL), optimizing application logic and queries to reduce processing times by up to 40%.',
            'Build interactive tools and prototypes in Unity and C# emphasizing reusable components, performance, and user experience.',
          ],
          tags: ['Flutter', 'Go', 'Python', 'Node.js', 'PostgreSQL', 'Unity'],
        ),
        ExperienceItem(
          role: 'Unity Developer / Software Engineer',
          company: 'Virtual Mind',
          period: '2026',
          location: 'Mexico',
          highlights: [
            'Developed virtual reality training simulators in Unity and C# (Meta Quest, OpenXR), implementing interaction logic, user tracking, and modular reusable components.',
            'Diagnosed and resolved functional and performance defects to deliver reliable, responsive interactive experiences.',
          ],
          tags: ['Unity 6', 'C#', 'Meta Quest', 'OpenXR', 'VR'],
        ),
        ExperienceItem(
          role: 'QA Tester',
          company: 'Lionbridge',
          period: '2026',
          location: 'Mexico',
          highlights: [
            'Executed functional and regression test suites across multiple platforms; documented reproducible defects and tracked resolution across the software development lifecycle.',
          ],
          tags: ['QA', 'Functional Testing', 'Regression', 'Cross-Platform'],
        ),
        ExperienceItem(
          role: 'Flutter Developer',
          company: 'CAPDESIS',
          period: '2024 – 2025',
          location: 'Mexico',
          highlights: [
            'Developed and maintained production Flutter applications for Android, iOS, and Web, including CapMenu, Ingeniería Tracker, and Formulae.',
            'Implemented business logic, REST API integration, JWT authentication, local persistence, and bilingual support; resolved backend, CORS, authentication, and cross-platform compatibility issues.',
            'Reduced application load times by approximately 20% and supported release preparation and publishing through Google Play Console and App Store Connect.',
          ],
          tags: [
            'Flutter',
            'REST APIs',
            'JWT',
            'Google Play',
            'App Store Connect',
          ],
        ),
      ],
      education: [
        EducationItem(
          degree: 'B.S. in Computer Engineering',
          institution:
              'Universidad Nacional Autónoma de México (UNAM) — Faculty of Engineering',
          period: '2019 – 2025',
          location: 'Mexico City, Mexico',
        ),
        EducationItem(
          degree: 'Diploma in Video Game Development and Creation',
          institution:
              'Universidad Nacional Autónoma de México (UNAM) — Faculty of Engineering',
          period: '2023 – 2024',
          location: 'Mexico City, Mexico',
        ),
      ],
      spokenLanguages: 'Spanish (Native) · English (Professional working)',
    );
  }
}
