import '../../domain/entities/project.dart';
import '../models/project_model.dart';

abstract class ProjectLocalDataSource {
  Future<List<ProjectModel>> getProjects(String lang);
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects(String lang) async {
    // I simulate a database call
    await Future.delayed(const Duration(milliseconds: 50));

    if (lang == 'es') {
      return const [
        ProjectModel(
          title: 'Simulador VR de Montacargas (Overview)',
          description:
              'Showcase de portafolio (sin código) de un simulador interactivo de capacitación en Realidad Virtual para operación segura de montacargas en almacén, desarrollado en colaboración con Virtual Mind Studio (VMS). Incluye módulos de inspección, conducción, manejo de carga, controles en cabina VR, soporte USB opcional e interfaz bilingüe.',
          tags: [
            'Unity',
            'C#',
            'VR',
            'Simulación',
            'Interfaz Bilingüe',
            'VMS',
          ],
          githubUrl: 'https://github.com/JoshuaLopez2000/Forklift-VR-Simulator',
          previewMedia: [
            ProjectMedia(
              // TODO: Añadir assetOrUrl (ej. 'assets/images/projects/forklift_cabin.gif') cuando esté disponible
              label: 'Controles en cabina VR',
              hint: 'Captura / GIF próximamente',
            ),
            ProjectMedia(
              // TODO: Añadir assetOrUrl (ej. 'assets/images/projects/forklift_driving.gif') cuando esté disponible
              label: 'Conducción y estacionamiento',
              hint: 'Captura / GIF próximamente',
            ),
            ProjectMedia(
              // TODO: Añadir assetOrUrl (ej. 'assets/images/projects/forklift_pallets.gif') cuando esté disponible
              label: 'Manejo y colocación de carga',
              hint: 'Captura / GIF próximamente',
            ),
          ],
        ),
        ProjectModel(
          title: 'Manga AR Experience',
          description:
              'MVP de realidad aumentada que reconoce paneles de manga y superpone escenas de anime con audio sincronizado en tiempo real.',
          tags: ['Flutter', 'Unity', 'Vuforia', 'AR'],
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
        ),
        ProjectModel(
          title: 'Simulación VR de Desorientación Espacial - Spacial Station',
          description:
              'Prototipo de simulación de Realidad Virtual (VR) inmersiva, diseñado para entrenar y evaluar la respuesta a la desorientación espacial en astronautas. Desarrollado en Unity, utiliza Universal Render Pipeline (URP) y el New Input System para una experiencia realista en un entorno de estación espacial.',
          tags: ['Unity', 'VR', 'C#', 'URP', 'Simulación', 'Realidad Virtual'],
          githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
          youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
          previewImage: 'assets/images/projects/spacial_station_preview.jpg',
        ),
        ProjectModel(
          title: 'Blades of the Fallen',
          description:
              'Blades of the Fallen es un juego de acción de tipo "endless fighter" desarrollado en Unity. Cuenta con una estética única de pintura con tinta china, un sistema de combate dinámico con ataques direccionales y mecánicas de parry (desvío), distintos tipos de enemigos y renderizado optimizado mediante el uso de MaterialPropertyBlock.',
          tags: [
            'Unity',
            'C#',
            'Desarrollo de Videojuegos',
            'Acción',
            'Pintura con Tinta China',
            'URP',
            'Móvil',
            'Arquitectura de Videojuegos',
          ],
          githubUrl: 'https://github.com/JoshuaLopez2000/BladesOfTheFallen.git',
          youtubeUrl: 'https://youtube.com/shorts/fyaWuhZleJY',
          previewImage: 'assets/images/projects/blades_of_the_fallen_preview.png',
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
        ),
        ProjectModel(
          title: 'Portafolio Personal (Flutter)',
          description:
              'Este portafolio, construido con Flutter, Dart y con soporte de internacionalización, muestra mis habilidades como desarrollador.',
          tags: [
            'Flutter',
            'Dart',
            'Web',
            'Mobile',
            'Desktop',
            'Internacionalización',
          ],
          githubUrl: 'https://github.com/JoshuaLopez2000/Portfolio',
          demoUrl: 'https://portfolio.joshua-lopez-nava-dev.workers.dev/',
          previewImage: 'assets/images/projects/portfolio_preview.png',
        ),
      ];
    }

    // I default to English
    return const [
      ProjectModel(
        title: 'VR Forklift Training Simulator (Overview)',
        description:
            'Non-code portfolio showcase of an interactive Virtual Reality training simulator for safe industrial forklift operation in a simulated warehouse, built in collaboration with Virtual Mind Studio (VMS). Features inspection, driving, and load-handling modules, in-cabin VR controls, optional USB wheel/pedals support, and bilingual UI.',
        tags: [
          'Unity',
          'C#',
          'VR',
          'Simulation',
          'Bilingual UI',
          'VMS',
        ],
        githubUrl: 'https://github.com/JoshuaLopez2000/Forklift-VR-Simulator',
        previewMedia: [
          ProjectMedia(
            // TODO: Add assetOrUrl (e.g. 'assets/images/projects/forklift_cabin.gif') when available
            label: 'VR In-Cabin Controls',
            hint: 'Screenshot / GIF coming soon',
          ),
          ProjectMedia(
            // TODO: Add assetOrUrl (e.g. 'assets/images/projects/forklift_driving.gif') when available
            label: 'Warehouse Driving Course',
            hint: 'Screenshot / GIF coming soon',
          ),
          ProjectMedia(
            // TODO: Add assetOrUrl (e.g. 'assets/images/projects/forklift_pallets.gif') when available
            label: 'Load & Pallet Handling',
            hint: 'Screenshot / GIF coming soon',
          ),
        ],
      ),
      ProjectModel(
        title: 'Manga AR Experience',
        description:
            'Augmented Reality MVP that recognizes manga panels and overlays anime scenes with synchronized audio in real time.',
        tags: ['Flutter', 'Unity', 'Vuforia', 'AR'],
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
      ),
      ProjectModel(
        title: 'VR Spatial Disorientation Simulation - Spacial Station',
        description:
            'Immersive Virtual Reality (VR) simulation prototype designed to train and evaluate responses to spatial disorientation in astronauts. Developed in Unity, it utilizes the Universal Render Pipeline (URP) and the New Input System for a realistic experience within a space station environment.',
        tags: ['Unity', 'VR', 'C#', 'URP', 'Simulation', 'Virtual Reality'],
        githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
        youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
        previewImage: 'assets/images/projects/spacial_station_preview.jpg',
      ),
      ProjectModel(
        title: 'Blades of the Fallen',
        description:
            'Blades of the Fallen is an endless action fighter built in Unity. It features a unique Chinese ink painting aesthetic, a dynamic combat system with directional attacks and parry mechanics, distinct enemy types, and optimized rendering using MaterialPropertyBlock.',
        tags: [
          'Unity',
          'C#',
          'Game Development',
          'Action',
          'Chinese Ink Painting',
          'URP',
          'Mobile',
          'Game Architecture',
        ],
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
      ),
      ProjectModel(
        title: 'Personal Portfolio (Flutter)',
        description:
            'This portfolio, built with Flutter, Dart, and internationalization support, showcases my development skills.',
        tags: [
          'Flutter',
          'Dart',
          'Web',
          'Mobile',
          'Desktop',
          'Internationalization',
        ],
        githubUrl: 'https://github.com/JoshuaLopez2000/Portfolio',
        demoUrl: 'https://portfolio.joshua-lopez-nava-dev.workers.dev/',
        previewImage: 'assets/images/projects/portfolio_preview.png',
      ),
    ];
  }
}
