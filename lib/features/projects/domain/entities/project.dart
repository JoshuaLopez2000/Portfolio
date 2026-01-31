class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final String? demoUrl;
  final String? youtubeUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.githubUrl,
    this.demoUrl,
    this.youtubeUrl,
  });
}
