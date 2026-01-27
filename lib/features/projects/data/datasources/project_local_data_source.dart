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
        ),
        ProjectModel(
          title: 'Sistema de Chat Distribuido',
          description:
              'Chat de alta concurrencia usando arquitectura de microservicios.',
          tags: ['Go', 'gRPC', 'Redis'],
          githubUrl: 'https://github.com',
          demoUrl: 'https://example.com',
        ),
        ProjectModel(
          title: 'Trading Bot',
          description:
              'Bot automatizado para comercio de criptomonedas con análisis técnico.',
          tags: ['Node.js', 'WebSockets', 'MongoDB'],
          githubUrl: 'https://github.com',
        ),
        ProjectModel(
          title: 'Portafolio Personal',
          description:
              'Este sitio web, construido para demostrar habilidades modernas de desarrollo.',
          tags: ['React', 'Tailwind', 'Vercel'],
          githubUrl: 'https://github.com',
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
      ),
      ProjectModel(
        title: 'Distributed Chat System',
        description: 'High-concurrency chat using microservices architecture.',
        tags: ['Go', 'gRPC', 'Redis'],
        githubUrl: 'https://github.com',
        demoUrl: 'https://example.com',
      ),
      ProjectModel(
        title: 'Trading Bot',
        description: 'Automated crypto trading bot with technical analysis.',
        tags: ['Node.js', 'WebSockets', 'MongoDB'],
        githubUrl: 'https://github.com',
      ),
      ProjectModel(
        title: 'Personal Portfolio',
        description:
            'This website, built to showcase modern development skills.',
        tags: ['React', 'Tailwind', 'Vercel'],
        githubUrl: 'https://github.com',
      ),
    ];
  }
}
