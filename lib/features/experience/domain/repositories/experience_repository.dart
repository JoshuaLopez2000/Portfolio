import '../entities/experience.dart';

abstract class ExperienceRepository {
  Future<ExperienceSummary> getExperience(String lang);
}
