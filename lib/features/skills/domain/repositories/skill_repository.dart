import '../entities/skill.dart';

abstract class SkillRepository {
  Future<List<Skill>> getSkills();
}
