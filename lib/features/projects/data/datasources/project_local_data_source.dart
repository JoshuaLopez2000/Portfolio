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
          title: 'Neural Network Visualizer',
          description: 'Herramienta interactiva para visualizar redes neuronales en tiempo real.',
          tags: ['Python', 'WebGL', 'Three.js'],
          githubUrl: 'https://github.com',
        ),
        ProjectModel(
          title: 'Sistema de Chat Distribuido',
          description: 'Chat de alta concurrencia usando arquitectura de microservicios.',
          tags: ['Go', 'gRPC', 'Redis'],
          githubUrl: 'https://github.com',
          demoUrl: 'https://example.com',
        ),
        ProjectModel(
          title: 'Trading Bot',
          description: 'Bot automatizado para comercio de criptomonedas con análisis técnico.',
          tags: ['Node.js', 'WebSockets', 'MongoDB'],
          githubUrl: 'https://github.com',
        ),
        ProjectModel(
          title: 'Portafolio Personal',
          description: 'Este sitio web, construido para demostrar habilidades modernas de desarrollo.',
          tags: ['React', 'Tailwind', 'Vercel'],
          githubUrl: 'https://github.com',
        ),
      ];
    }

    // I default to English
    return const [
      ProjectModel(
        title: 'Neural Network Visualizer',
        description: 'Interactive tool to visualize neural networks in real-time.',
        tags: ['Python', 'WebGL', 'Three.js'],
        githubUrl: 'https://github.com',
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
        description: 'This website, built to showcase modern development skills.',
        tags: ['React', 'Tailwind', 'Vercel'],
        githubUrl: 'https://github.com',
      ),
    ];
  }
}
