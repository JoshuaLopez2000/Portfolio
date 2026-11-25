import '../../domain/entities/project.dart';
import '../models/project_model.dart';

abstract class ProjectLocalDataSource {
  Future<List<ProjectModel>> getProjects(String lang);
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects(String lang) async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (lang == 'es') {
      return const [
        ProjectModel(
          title: 'Vaquita MX — Flutter + API Go',
          description:
              'Aplicación de gastos grupales para México con cliente multiplataforma en Flutter (Android/Web), API REST en Go sin dependencias externas, PostgreSQL con migraciones versionadas, tokens rotativos y adaptador CoDi.',
          tags: [
            'Flutter',
            'Go',
            'PostgreSQL',
            'REST API',
            'Docker',
            'CoDi',
          ],
          githubUrl: 'https://github.com/JoshuaLopez2000/vaquita-mx',
          previewMedia: [
            ProjectMedia(
              // TODO: Reemplazar con captura/GIF de la app Flutter cuando esté lista
              label: 'Cliente Flutter (Android & Web)',
              hint: 'Captura / GIF próximamente',
            ),
            ProjectMedia(
              // TODO: Reemplazar con captura de arquitectura API Go + PostgreSQL + Docker
              label: 'API Go · PostgreSQL · Docker',
              hint: 'Captura / GIF próximamente',
            ),
          ],
          caseStudy: ProjectCaseStudy(
            category: 'Full-Stack · Flutter + Go',
            role: 'Desarrollador Full-Stack (Arquitectura & Implementación)',
            period: '2026',
            problem:
                'Dividir gastos grupales en México suele terminar en errores de redondeo, falta de trazabilidad entre gastos y liquidaciones, y acoplamiento fuerte a un único proveedor de cobro.',
            solution:
                'Diseñé un slice vertical completo con cliente Flutter (Android/Web) y backend HTTP en Go sin frameworks pesados, respaldado por PostgreSQL en Docker Compose con migraciones versionadas y un adaptador intercambiable preparado para flujos de cobro CoDi.',
            highlights: [
              'Contabilidad exacta en centavos enteros (sin punto flotante para montos) con historiales separados de gastos y liquidaciones.',
              'Autenticación con access tokens de 15 minutos y refresh tokens rotativos para sesiones de dispositivo de 30 días (migración 0003_rotating_sessions).',
              'Pruebas de integración en Go respaldadas por PostgreSQL con esquemas aislados por prueba para CI paralelo.',
              'Orquestación en Docker Compose que espera a PostgreSQL, ejecuta migraciones en un contenedor de un solo uso y luego inicia la API.',
              'Documentación de ingeniería completa: arquitectura, especificación API, seguridad, estrategia CoDi y despliegue.',
            ],
            impact:
                'Demuestra ingeniería full-stack lista para producción en Flutter + Go + PostgreSQL + Docker, con control estricto de dinero, sesiones seguras y separación limpia de proveedores de pago.',
          ),
        ),
        ProjectModel(
          title: 'Simulador VR de Montacargas (Overview)',
          description:
              'Simulador interactivo de capacitación en Realidad Virtual (Unity 6, Meta Quest, OpenXR) desarrollado en Virtual Mind. Incluye módulos evaluados de inspección, conducción, estacionamiento y manejo de carga con soporte calibrable para volante y pedales USB.',
          tags: [
            'Unity 6',
            'C#',
            'Meta Quest',
            'OpenXR',
            'USB Rig',
            'VMS',
          ],
          githubUrl: 'https://github.com/JoshuaLopez2000/Forklift-VR-Simulator',
          previewImage: 'assets/images/projects/forklift_vr_preview.png',
          previewMedia: [
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/forklift_vr_preview.png',
              label: 'Menú principal en VR',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/forklift_main_menu.gif',
              label: 'Selección de módulo en VR',
            ),
            ProjectMedia(
              assetOrUrl:
                  'assets/images/projects/forklift_exterior_inspection.gif',
              label: 'Inspección exterior previa',
            ),
            ProjectMedia(
              assetOrUrl:
                  'assets/images/projects/forklift_interior_inspection.gif',
              label: 'Inspección de controles en cabina',
            ),
            ProjectMedia(
              assetOrUrl:
                  'assets/images/projects/forklift_inspection_evaluation.png',
              label: 'Evaluación de inspección',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/forklift_driving.gif',
              label: 'Conducción y estacionamiento',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/forklift_load_handling.gif',
              label: 'Manejo y colocación de carga',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/forklift_session_results.png',
              label: 'Resultados y métricas de sesión',
            ),
          ],
          caseStudy: ProjectCaseStudy(
            category: 'Realidad Virtual · Virtual Mind',
            role: 'Unity Developer / Software Engineer (VMS)',
            period: '2026',
            problem:
                'Capacitar operadores de montacargas industriales en almacén físico implica costos operativos altos y riesgos de seguridad durante las primeras prácticas de conducción y maniobra de carga.',
            solution:
                'Desarrollé de principio a fin un simulador inmersivo en Unity 6 y C# orientado a visores VR autónomos (Meta Quest / OpenXR) con módulos estructurados de evaluación, físicas de vehículo, controles interactivos en cabina e interfaz bilingüe (ES/EN).',
            highlights: [
              'Módulos evaluados de inspección previa, conducción y estacionamiento, manejo/colocación de pallets y práctica libre cronometrada con seguridad peatonal.',
              'Operación directa en VR de llave de encendido, selector de marcha, volante y palancas hidráulicas (elevación, inclinación y desplazamiento lateral).',
              'Compatibilidad calibrable con volante y pedales físicos vía USB mediante Unity Input System.',
              'Resumen consolidado de sesión con puntuación, tiempos y métricas específicas de seguridad.',
              'Diagnóstico y resolución de incidencias funcionales y optimización de rendimiento para visores VR autónomos. (Showcase sin código por acuerdos de confidencialidad con VMS.)',
            ],
            impact:
                'Entregó una experiencia de entrenamiento VR estable, modular y bilingüe lista para cabinas físicas o visores autónomos.',
          ),
        ),
        ProjectModel(
          title: 'Manga AR Experience',
          description:
              'Aplicación móvil en Flutter integrada con Unity y Vuforia que reconoce paneles físicos de manga y superpone escenas de anime con audio sincronizado en tiempo real.',
          tags: ['Flutter', 'Unity', 'Vuforia', 'AR', 'Android'],
          githubUrl: 'https://github.com/JoshuaLopez2000/mangaARExperience',
          youtubeUrl: 'https://youtube.com/shorts/dTGCruXgcEc',
          previewImage: 'assets/images/projects/manga_ar_preview.png',
          previewMedia: [
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/manga_ar_preview.png',
              label: 'Captura AR',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/manga_ar_preview.gif',
              label: 'Contenido AR en acción',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/manga_pick_series.gif',
              label: 'Selección de serie',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/manga_pick_volume.gif',
              label: 'Selección de tomo',
            ),
          ],
          caseStudy: ProjectCaseStudy(
            category: 'Realidad Aumentada · Móvil',
            role: 'Desarrollador Mobile & AR',
            period: '2025',
            problem:
                'Conectar la experiencia de lectura de manga impreso con contenido audiovisual sin obligar al usuario a salir de la página ni sufrir pausas largas al abrir un motor 3D embebido.',
            solution:
                'Integré una interfaz móvil en Flutter (selección de serie y tomo) con un módulo embebido de Unity + Vuforia mediante flutter_unity_widget que rastrea paneles físicos y reproduce animaciones sincronizadas sobre la página.',
            highlights: [
              'Puente bidireccional Flutter ↔ Unity para selección de catálogo, volumen activo y transición hacia cámara AR.',
              'Precarga en segundo plano del motor Unity para reducir la latencia percibida al iniciar el escaneo.',
              'Reconocimiento de targets visuales impresos con Vuforia y superposición con audio sincronizado en tiempo real.',
            ],
            impact:
                'Demuestra integración nativa entre Flutter y Unity en dispositivo físico con transiciones fluidas y rastreo estable.',
          ),
        ),
        ProjectModel(
          title: 'Blades of the Fallen',
          description:
              'Juego de acción móvil en Unity 6 (URP) con estética de tinta china, combate direccional con parry cronometrado, núcleo desacoplado del motor y pruebas unitarias en EditMode.',
          tags: ['Unity 6', 'C#', 'URP', 'Mobile', 'EditMode Tests'],
          githubUrl: 'https://github.com/JoshuaLopez2000/BladesOfTheFallen.git',
          youtubeUrl: 'https://youtube.com/shorts/fyaWuhZleJY',
          previewImage:
              'assets/images/projects/blades_of_the_fallen_preview.png',
          previewMedia: [
            ProjectMedia(
              assetOrUrl:
                  'assets/images/projects/blades_of_the_fallen_preview.png',
              label: 'Banner del juego',
            ),
            ProjectMedia(
              assetOrUrl: 'assets/images/projects/blades_of_the_fallen.gif',
              label: 'Gameplay en acción',
            ),
          ],
          caseStudy: ProjectCaseStudy(
            category: 'Arquitectura de Videojuegos · Unity 6',
            role: 'Gameplay & Architecture Developer',
            period: '2025 – 2026',
            problem:
                'Los juegos móviles de acción suelen acoplar reglas de negocio directamente a MonoBehaviours y generar picos de Garbage Collector al instanciar enemigos o clonar materiales por frame.',
            solution:
                'Separé las reglas de sesión, dificultad y puntuación en un ensamblado independiente de Unity (BladesOfTheFallen.Core) con adaptadores explícitos para el runtime, pools precalentados y shaders con MaterialPropertyBlock.',
            highlights: [
              'Fronteras explícitas de ensamblado: Core independiente de Unity, capa de adaptadores runtime y suite de pruebas EditMode.',
              'Renderizado consciente de asignaciones reutilizando MaterialPropertyBlock en lugar de clonar materiales.',
              'Pools precalentados de enemigos y registro 1D de espaciado para eliminar raycasts físicos por enemigo.',
              'Combate por fases (startup, active, recovery) con parry basado en curva configurable de time-scale y señal visual en cian.',
            ],
            impact:
                'Arquitectura limpia y testeable en EditMode que evita acoplamiento con el motor y mantiene frame-rate estable en móvil.',
          ),
        ),
        ProjectModel(
          title: 'Spacial Station — Simulación VR',
          description:
              'Simulación inmersiva de Realidad Virtual en Unity (URP + XR) diseñada para entrenar y evaluar respuestas ante desorientación espacial en un entorno de estación espacial con shaders personalizados.',
          tags: ['Unity', 'VR', 'C#', 'URP', 'Shader Graph'],
          githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
          youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
          previewImage: 'assets/images/projects/spacial_station_preview.jpg',
          caseStudy: ProjectCaseStudy(
            category: 'Simulación VR · Shaders',
            role: 'VR Developer',
            period: '2025',
            problem:
                'La desorientación espacial es un reto cognitivo crítico en misiones aeroespaciales y difícil de entrenar de manera segura fuera de entornos virtuales controlados.',
            solution:
                'Construí un entorno 3D de estación espacial en Unity XR (URP + New Input System) combinando alteraciones sensoriales, visor de casco, interfaces holográficas y tareas interactivas bajo gestión de energía.',
            highlights: [
              'Shaders personalizados en Shader Graph y HLSL para interfaces holográficas, efectos de disolución y resaltado de objetos interactivos.',
              'Interacción 3D directa con paneles y botones en cabina mediante scripts modulares.',
              'Iluminación dinámica y sistema de visor de casco para inducir y evaluar respuesta ante desorientación.',
            ],
            impact:
                'Valida un flujo completo de entrenamiento inmersivo en VR combinando gráficos personalizados con interacción física 3D.',
          ),
        ),
        ProjectModel(
          title: 'Portafolio Personal (Flutter Web)',
          description:
              'Aplicación web bilingüe (ES/EN) construida con Flutter, Clean Architecture y desplegada en Cloudflare Workers con galerías interactivas de capturas/GIFs, casos de estudio y descarga de CV.',
          tags: ['Flutter', 'Dart', 'Web', 'i18n', 'Cloudflare Workers'],
          githubUrl: 'https://github.com/JoshuaLopez2000/Portfolio',
          demoUrl: 'https://portfolio.joshua-lopez-nava-dev.workers.dev/',
          previewImage: 'assets/images/projects/portfolio_preview.png',
          caseStudy: ProjectCaseStudy(
            category: 'Flutter Web · Cloudflare Workers',
            role: 'Diseño & Desarrollo End-to-End',
            period: '2026',
            problem:
                'Presentar de forma clara y verificable proyectos de áreas distintas (Flutter, Go/Backend y Unity XR) en un solo sitio rápido y bilingüe pensado para reclutadores.',
            solution:
                'Estructuré el sitio en Flutter Web por capas de dominio/datos/presentación, con soporte EN/ES en tiempo real, galerías optimizadas para imágenes verticales y GIFs, casos de estudio y despliegue continuo con Cloudflare CLI (`cf`).',
            highlights: [
              'Arquitectura modular por features (profile, projects, experience, skills) con pruebas de widgets.',
              'Optimización de iconos con tree-shaking (~98-99% de reducción en fuentes) y carga progresiva de GIFs.',
              'Despliegue en Cloudflare Workers Static Assets con SPA fallback y metadatos Open Graph.',
            ],
            impact:
                'Sitio en producción con tiempos de respuesta en el edge de Cloudflare y soporte completo para escritorio y móvil.',
          ),
        ),
      ];
    }

    return const [
      ProjectModel(
        title: 'Vaquita MX — Flutter + Go API',
        description:
            'Group expense application for Mexico with a cross-platform Flutter client (Android/Web), dependency-free Go REST API, versioned PostgreSQL migrations, rotating session tokens, and a replaceable CoDi adapter.',
        tags: ['Flutter', 'Go', 'PostgreSQL', 'REST API', 'Docker', 'CoDi'],
        githubUrl: 'https://github.com/JoshuaLopez2000/vaquita-mx',
        previewMedia: [
          ProjectMedia(
            // TODO: Replace with Flutter app capture/GIF when ready
            label: 'Flutter Client (Android & Web)',
            hint: 'Screenshot / GIF coming soon',
          ),
          ProjectMedia(
            // TODO: Replace with Go API + PostgreSQL + Docker architecture visual
            label: 'Go API · PostgreSQL · Docker',
            hint: 'Screenshot / GIF coming soon',
          ),
        ],
        caseStudy: ProjectCaseStudy(
          category: 'Full-Stack · Flutter + Go',
          role: 'Full-Stack Developer (Architecture & Implementation)',
          period: '2026',
          problem:
              'Group expense splitting in Mexico often suffers from floating-point rounding bugs, blurred expense vs. settlement history, and tight coupling to a single payment provider.',
          solution:
              'Engineered a complete vertical slice with a Flutter client (Android/Web) and a dependency-free Go HTTP API backed by PostgreSQL in Docker Compose, versioned SQL migrations, and a replaceable payment adapter modeled for CoDi flows.',
          highlights: [
            'Exact integer centavos accounting (no floating point for money) with separate expense and settlement histories.',
            '15-minute access tokens and rotating refresh tokens for 30-day device sessions (migration 0003_rotating_sessions).',
            'PostgreSQL-backed Go integration tests with isolated per-test schemas for parallel CI runs.',
            'Docker Compose stack that waits for PostgreSQL, applies migrations in a one-off container, and then starts the API.',
            'Complete engineering docs covering product spec, architecture, API reference, security, CoDi strategy, and deployment.',
          ],
          impact:
              'Demonstrates production-minded full-stack engineering across Flutter, Go, PostgreSQL, and Docker with strict financial precision and auth security.',
        ),
      ),
      ProjectModel(
        title: 'VR Forklift Training Simulator (Overview)',
        description:
            'Interactive Virtual Reality training simulator (Unity 6, Meta Quest, OpenXR) built at Virtual Mind. Features scored inspection, driving, parking, and load-handling modules plus calibratable USB wheel/pedal support.',
        tags: ['Unity 6', 'C#', 'Meta Quest', 'OpenXR', 'USB Rig', 'VMS'],
        githubUrl: 'https://github.com/JoshuaLopez2000/Forklift-VR-Simulator',
        previewImage: 'assets/images/projects/forklift_vr_preview.png',
        previewMedia: [
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/forklift_vr_preview.png',
            label: 'VR Main Menu',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/forklift_main_menu.gif',
            label: 'VR Module Selection',
          ),
          ProjectMedia(
            assetOrUrl:
                'assets/images/projects/forklift_exterior_inspection.gif',
            label: 'Exterior Pre-Operation Inspection',
          ),
          ProjectMedia(
            assetOrUrl:
                'assets/images/projects/forklift_interior_inspection.gif',
            label: 'In-Cabin Controls Inspection',
          ),
          ProjectMedia(
            assetOrUrl:
                'assets/images/projects/forklift_inspection_evaluation.png',
            label: 'Inspection Evaluation',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/forklift_driving.gif',
            label: 'Warehouse Driving & Parking',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/forklift_load_handling.gif',
            label: 'Load & Pallet Handling',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/forklift_session_results.png',
            label: 'Session Summary & Scoring',
          ),
        ],
        caseStudy: ProjectCaseStudy(
          category: 'Virtual Reality · Virtual Mind',
          role: 'Unity Developer / Software Engineer (VMS)',
          period: '2026',
          problem:
              'Training industrial forklift operators in live warehouses carries high equipment costs and safety risks during early driving and pallet-handling practice.',
          solution:
              'Built an end-to-end VR training simulator in Unity 6 and C# for standalone headsets (Meta Quest / OpenXR) with scored modules, vehicle physics, interactive cabin controls, and a bilingual (ES/EN) interface.',
          highlights: [
            'Structured evaluation modules for pre-operation inspection, guided driving & parking, pallet placement, and timed warehouse practice with pedestrian safety.',
            'Hands-on VR cabin controls: ignition key, F/N/R gear selector, steering wheel, and hydraulic mast levers (lift, tilt, side-shift).',
            'Optional calibratable USB steering wheel and pedal rig support via Unity Input System.',
            'Consolidated session summary with per-activity scoring, timing, and operational safety metrics.',
            'Diagnosed functional/performance issues and optimized rendering for standalone VR. (Non-code showcase under VMS confidentiality agreements.)',
          ],
          impact:
              'Delivered a stable, modular, bilingual VR training product compatible with both standalone headsets and physical USB simulator rigs.',
        ),
      ),
      ProjectModel(
        title: 'Manga AR Experience',
        description:
            'Mobile Flutter application integrated with Unity and Vuforia that recognizes physical manga panels and overlays anime scenes with synchronized audio in real time.',
        tags: ['Flutter', 'Unity', 'Vuforia', 'AR', 'Android'],
        githubUrl: 'https://github.com/JoshuaLopez2000/mangaARExperience',
        youtubeUrl: 'https://youtube.com/shorts/dTGCruXgcEc',
        previewImage: 'assets/images/projects/manga_ar_preview.png',
        previewMedia: [
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/manga_ar_preview.png',
            label: 'AR Screenshot',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/manga_ar_preview.gif',
            label: 'AR Content in Action',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/manga_pick_series.gif',
            label: 'Pick a Series',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/manga_pick_volume.gif',
            label: 'Pick a Volume',
          ),
        ],
        caseStudy: ProjectCaseStudy(
          category: 'Augmented Reality · Mobile',
          role: 'Mobile & AR Developer',
          period: '2025',
          problem:
              'Bridging printed manga reading with interactive video without forcing readers away from physical pages or introducing heavy load pauses when launching a 3D engine.',
          solution:
              'Integrated a Flutter series/volume browser with an embedded Unity + Vuforia AR module via flutter_unity_widget to track physical panels and overlay synchronized anime playback.',
          highlights: [
            'Two-way Flutter ↔ Unity bridge for catalog selection, active volume context, and AR camera transitions.',
            'Background Unity preloading to reduce perceived latency when entering AR scanning mode.',
            'Printed image-target recognition via Vuforia with synchronized real-time video and audio overlays.',
          ],
          impact:
              'Demonstrates smooth native Flutter-to-Unity embedding and real-time AR target tracking on physical Android hardware.',
        ),
      ),
      ProjectModel(
        title: 'Blades of the Fallen',
        description:
            'Mobile action game in Unity 6 (URP) featuring a Chinese ink-painting style, directional combat with timed parries, an engine-independent core assembly, and EditMode unit tests.',
        tags: ['Unity 6', 'C#', 'URP', 'Mobile', 'EditMode Tests'],
        githubUrl: 'https://github.com/JoshuaLopez2000/BladesOfTheFallen.git',
        youtubeUrl: 'https://youtube.com/shorts/fyaWuhZleJY',
        previewImage: 'assets/images/projects/blades_of_the_fallen_preview.png',
        previewMedia: [
          ProjectMedia(
            assetOrUrl:
                'assets/images/projects/blades_of_the_fallen_preview.png',
            label: 'Game Banner',
          ),
          ProjectMedia(
            assetOrUrl: 'assets/images/projects/blades_of_the_fallen.gif',
            label: 'Gameplay Preview',
          ),
        ],
        caseStudy: ProjectCaseStudy(
          category: 'Game Architecture · Unity 6',
          role: 'Gameplay & Architecture Developer',
          period: '2025 – 2026',
          problem:
              'Mobile action games frequently couple domain rules to MonoBehaviours and trigger GC spikes by instantiating enemies or cloning materials per frame.',
          solution:
              'Isolated session state, difficulty progression, and high-score logic in an engine-independent assembly (BladesOfTheFallen.Core) paired with thin Unity runtime adapters, prewarmed enemy pools, and MaterialPropertyBlock rendering.',
          highlights: [
            'Explicit assembly boundaries separating pure C# Core rules, Unity runtime adapters, and fast EditMode unit tests.',
            'Allocation-conscious rendering reusing MaterialPropertyBlock instances instead of cloning materials.',
            'Prewarmed enemy pools and a 1D spacing registry replacing per-enemy physics raycasts.',
            'Phase-driven combat (startup, active, recovery) with curve-driven parry slow-motion and cyan counter cues.',
          ],
          impact:
              'Clean, testable Unity architecture that prevents engine coupling and maintains smooth frame pacing on mobile.',
        ),
      ),
      ProjectModel(
        title: 'Spacial Station — VR Simulation',
        description:
            'Immersive Virtual Reality simulation in Unity (URP + XR) designed to train and evaluate spatial disorientation responses inside a space station with custom shaders.',
        tags: ['Unity', 'VR', 'C#', 'URP', 'Shader Graph'],
        githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
        youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
        previewImage: 'assets/images/projects/spacial_station_preview.jpg',
        caseStudy: ProjectCaseStudy(
          category: 'VR Simulation · Shaders',
          role: 'VR Developer',
          period: '2025',
          problem:
              'Spatial disorientation is a critical cognitive challenge in aerospace missions that is difficult to reproduce safely outside controlled virtual environments.',
          solution:
              'Built a 3D space station training environment in Unity XR (URP + New Input System) combining sensory alterations, helmet visor mechanics, holographic UI, and interactive tasks.',
          highlights: [
            'Custom Shader Graph and HLSL shaders for holographic interfaces, object dissolve effects, and interactive outline highlights.',
            'Direct 3D panel and button interaction built with modular input scripts.',
            'Dynamic warning lighting and visor activation mechanics to evaluate decision-making under disorientation.',
          ],
          impact:
              'Validates a complete immersive VR training loop blending custom shader authoring with physical 3D interactions.',
        ),
      ),
      ProjectModel(
        title: 'Personal Portfolio (Flutter Web)',
        description:
            'Bilingual (EN/ES) web application built with Flutter and Clean Architecture, deployed on Cloudflare Workers with screenshot/GIF carousels, case studies, and bilingual CV downloads.',
        tags: ['Flutter', 'Dart', 'Web', 'i18n', 'Cloudflare Workers'],
        githubUrl: 'https://github.com/JoshuaLopez2000/Portfolio',
        demoUrl: 'https://portfolio.joshua-lopez-nava-dev.workers.dev/',
        previewImage: 'assets/images/projects/portfolio_preview.png',
        caseStudy: ProjectCaseStudy(
          category: 'Flutter Web · Cloudflare Workers',
          role: 'End-to-End Design & Engineering',
          period: '2026',
          problem:
              'Presenting cross-disciplinary work (Flutter, Go backend, and Unity XR) clearly and quickly for both recruiters and technical hiring managers.',
          solution:
              'Architected a bilingual Flutter Web single-page app organized by feature layers, with adaptive media galleries, structured case studies, and edge deployment via Cloudflare CLI (`cf`).',
          highlights: [
            'Feature-layered Clean Architecture (profile, projects, experience, skills) covered by widget tests.',
            'Icon font optimization with ~98-99% tree-shaking reduction and on-demand GIF slide rendering.',
            'Deployed to Cloudflare Workers Static Assets with SPA fallback and Open Graph metadata.',
          ],
          impact:
              'Fast edge-hosted portfolio designed for rapid recruiter scanning across desktop and mobile.',
        ),
      ),
    ];
  }
}
