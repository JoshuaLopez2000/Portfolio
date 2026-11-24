import '../entities/experience.dart';
import '../repositories/experience_repository.dart';

class GetExperience {
  final ExperienceRepository repository;

  GetExperience(this.repository);

  Future<ExperienceSummary> call({required String lang}) {
    return repository.getExperience(lang);
  }
}
