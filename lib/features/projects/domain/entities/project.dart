class ProjectMedia {
  /// Local asset path (e.g. `assets/images/projects/demo.gif`) or remote URL.
  /// Leave `null` to display a labeled placeholder slot until the capture/GIF is added.
  final String? assetOrUrl;
  final String label;
  final String? hint;

  const ProjectMedia({
    this.assetOrUrl,
    required this.label,
    this.hint,
  });

  bool get isPlaceholder => assetOrUrl == null || assetOrUrl!.isEmpty;
  bool get isGif =>
      assetOrUrl != null && assetOrUrl!.toLowerCase().split('?').first.endsWith('.gif');
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final String? demoUrl;
  final String? youtubeUrl;
  final String? previewImage;
  final List<ProjectMedia> previewMedia;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.githubUrl,
    this.demoUrl,
    this.youtubeUrl,
    this.previewImage,
    this.previewMedia = const [],
  });
}
