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
          title: 'Manga AR Experience',
          description:
              'MVP de realidad aumentada que reconoce paneles de manga y superpone escenas de anime con audio sincronizado en tiempo real.',
          tags: ['Flutter', 'Unity', 'Vuforia', 'AR'],
          githubUrl: 'https://github.com/JoshuaLopez2000/mangaARExperience',
          youtubeUrl: 'https://youtube.com/shorts/dTGCruXgcEc',
        ),
        ProjectModel(
          title: 'Simulación VR de Desorientación Espacial - Spacial Station',
          description:
              'Prototipo de simulación de Realidad Virtual (VR) inmersiva, diseñado para entrenar y evaluar la respuesta a la desorientación espacial en astronautas. Desarrollado en Unity, utiliza Universal Render Pipeline (URP) y el New Input System para una experiencia realista en un entorno de estaciónespacial.',
          tags: ['Unity', 'VR', 'C#', 'URP', 'Simulación', 'Realidad Virtual'],
          githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
          youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
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
        ),
      ];
    }

    // I default to English
    return const [
      ProjectModel(
        title: 'Manga AR Experience',
        description:
            'Augmented Reality MVP that recognizes manga panels and overlays anime scenes with synchronized audio in real time.',
        tags: ['Flutter', 'Unity', 'Vuforia', 'AR'],
        githubUrl: 'https://github.com/JoshuaLopez2000/mangaARExperience',
        youtubeUrl: 'https://youtube.com/shorts/dTGCruXgcEc',
      ),
      ProjectModel(
        title: 'VR Spatial Disorientation Simulation - Spacial Station',
        description:
            'Immersive Virtual Reality (VR) simulation prototype designed to train and evaluate responses to spatial disorientation in astronauts. Developed in Unity, it utilizes the Universal Render Pipeline (URP) and the New Input System for a realistic experience within a space station environment.',
        tags: ['Unity', 'VR', 'C#', 'URP', 'Simulation', 'Virtual Reality'],
        githubUrl: 'https://github.com/JoshuaLopez2000/SpacialStation',
        youtubeUrl: 'https://youtu.be/zLwRVIe4Skg',
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
      ),
    ];
  }
}
