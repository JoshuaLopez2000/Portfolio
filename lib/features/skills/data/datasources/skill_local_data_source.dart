import '../models/skill_model.dart';

abstract class SkillLocalDataSource {
  Future<List<SkillModel>> getSkills();
}

class SkillLocalDataSourceImpl implements SkillLocalDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return const [
      SkillModel(name: 'Flutter / Dart', iconCode: 'flutter'),
      SkillModel(name: 'Unity / C#', iconCode: 'unity'),
      SkillModel(name: 'Augmented Reality', iconCode: 'cube'),
      SkillModel(name: 'Linux Systems', iconCode: 'linux'),
      SkillModel(name: 'C / C++', iconCode: 'code'),
      SkillModel(name: 'Game Development', iconCode: 'gamepad'),
      SkillModel(name: 'Git / DevOps', iconCode: 'git-alt'),
      SkillModel(name: 'Mobile Architecture', iconCode: 'mobile-alt'),
      SkillModel(name: 'Python', iconCode: 'python'),
      SkillModel(name: 'JavaScript', iconCode: 'js'),
      SkillModel(name: 'Docker', iconCode: 'docker'),
      SkillModel(name: 'AWS', iconCode: 'aws'),
      SkillModel(name: 'SQL Databases', iconCode: 'database'),
    ];
  }
}
