class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final String? demoUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.githubUrl,
    this.demoUrl,
  });
}
