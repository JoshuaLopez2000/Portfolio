import '../entities/skill.dart';
import '../repositories/skill_repository.dart';

class GetSkills {
  final SkillRepository repository;

  GetSkills(this.repository);

  Future<List<Skill>> call() async {
    return await repository.getSkills();
  }
}
