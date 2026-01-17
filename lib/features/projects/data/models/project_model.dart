import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.title,
    required super.description,
    required super.tags,
    required super.githubUrl,
    super.demoUrl,
  });
}
