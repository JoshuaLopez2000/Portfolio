class Profile {
  final String name;
  final String email;
  final String? githubUrl;
  final String? linkedinUrl;
  final String? cvEsPath;
  final String? cvEnPath;

  const Profile({
    required this.name,
    required this.email,
    this.githubUrl,
    this.linkedinUrl,
    this.cvEsPath,
    this.cvEnPath,
  });

  String? cvPathForLocale(String languageCode) {
    if (languageCode == 'es') {
      return cvEsPath ?? cvEnPath;
    }
    return cvEnPath ?? cvEsPath;
  }
}
