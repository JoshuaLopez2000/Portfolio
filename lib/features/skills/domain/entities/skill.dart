enum SkillCategory { mobile, interactive, backendTools }

class Skill {
  final String name;
  final String iconCode;
  final SkillCategory category;

  const Skill({
    required this.name,
    required this.iconCode,
    required this.category,
  });
}
