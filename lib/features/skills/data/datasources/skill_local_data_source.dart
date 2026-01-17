import '../models/skill_model.dart';

abstract class SkillLocalDataSource {
  Future<List<SkillModel>> getSkills();
}

class SkillLocalDataSourceImpl implements SkillLocalDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return const [
      SkillModel(name: 'Python', iconCode: 'python'),
      SkillModel(name: 'Dart/Flutter', iconCode: 'code'),
      SkillModel(name: 'JavaScript', iconCode: 'js'),
      SkillModel(name: 'Docker', iconCode: 'docker'),
      SkillModel(name: 'Linux', iconCode: 'linux'),
      SkillModel(name: 'Git', iconCode: 'gitAlt'),
      SkillModel(name: 'AWS', iconCode: 'aws'),
      SkillModel(name: 'SQL', iconCode: 'database'),
    ];
  }
}
