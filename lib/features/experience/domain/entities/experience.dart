class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> highlights;
  final List<String> tags;
  final bool isCurrent;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.highlights,
    this.tags = const [],
    this.isCurrent = false,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String period;
  final String location;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.location,
  });
}

class ExperienceSummary {
  final List<ExperienceItem> experiences;
  final List<EducationItem> education;
  final String spokenLanguages;

  const ExperienceSummary({
    required this.experiences,
    required this.education,
    required this.spokenLanguages,
  });
}
