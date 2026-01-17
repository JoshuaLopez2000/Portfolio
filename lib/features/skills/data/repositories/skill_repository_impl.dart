import '../../domain/entities/skill.dart';
import '../../domain/repositories/skill_repository.dart';
import '../datasources/skill_local_data_source.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillLocalDataSource localDataSource;

  SkillRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Skill>> getSkills() async {
    // I retrieve the skill list from the local data source.
    return await localDataSource.getSkills();
  }
}
