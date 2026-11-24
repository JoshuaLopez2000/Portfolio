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
      // Mobile, Web & XR
      SkillModel(
        name: 'Flutter / Dart',
        iconCode: 'flutter',
        category: SkillCategory.mobile,
      ),
      SkillModel(
        name: 'Android & iOS',
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
        name: 'OpenXR / Meta Quest',
        iconCode: 'gamepad',
        category: SkillCategory.interactive,
      ),
      SkillModel(
        name: 'Vuforia (AR)',
        iconCode: 'cube',
        category: SkillCategory.interactive,
      ),
      // Backend, Data & Delivery
      SkillModel(
        name: 'Go',
        iconCode: 'code',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Node.js',
        iconCode: 'js',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Python',
        iconCode: 'python',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'REST APIs / JWT',
        iconCode: 'code',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'PostgreSQL / MySQL',
        iconCode: 'database',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Docker',
        iconCode: 'docker',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Git / CI/CD',
        iconCode: 'git-alt',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'Play Store & App Store',
        iconCode: 'mobile-alt',
        category: SkillCategory.backendTools,
      ),
      SkillModel(
        name: 'QA & Testing',
        iconCode: 'linux',
        category: SkillCategory.backendTools,
      ),
    ];
  }
}
