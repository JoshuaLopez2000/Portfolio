import '../../domain/entities/skill.dart';
import '../models/skill_model.dart';

abstract class SkillLocalDataSource {
  Future<List<SkillModel>> getSkills();
}

class SkillLocalDataSourceImpl implements SkillLocalDataSource {
  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return const [
      SkillModel(
        name: 'Flutter / Dart',
        iconCode: 'flutter',
        category: SkillCategory.mobile,
      ),
      SkillModel(
        name: 'Mobile Architecture',
        iconCode: 'mobile-alt',
        category: SkillCategory.mobile,
      ),
      SkillModel(
        name: 'JavaScript',
        iconCode: 'js',
        category: SkillCategory.mobile,
      ),
      SkillModel(
        name: 'Unity / C#',
        iconCode: 'unity',
        category: SkillCategory.interactive,
      ),
      SkillModel(
        name: 'Augmented Reality',
        iconCode: 'cube',
        category: SkillCategory.interactive,
      ),
      SkillModel(
        name: 'Game Development',
        iconCode: 'gamepad',
        category: SkillCategory.interactive,
      ),
      SkillModel(
        name: 'Python',
        iconCode: 'python',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'C / C++',
        iconCode: 'code',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'SQL Databases',
        iconCode: 'database',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Linux Systems',
        iconCode: 'linux',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Git / DevOps',
        iconCode: 'git-alt',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Docker',
        iconCode: 'docker',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'AWS',
        iconCode: 'aws',
        category: SkillCategory.backendTools,
      ),
    ];
  }
}
