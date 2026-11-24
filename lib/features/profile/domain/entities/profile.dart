class Profile {
  final String name;
  final String email;
  final String? githubUrl;
  final String? linkedinUrl;

  const Profile({
    required this.name,
    required this.email,
    this.githubUrl,
    this.linkedinUrl,
  });
}
