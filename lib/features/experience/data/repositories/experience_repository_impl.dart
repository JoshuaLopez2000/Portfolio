import '../../domain/entities/experience.dart';
import '../../domain/repositories/experience_repository.dart';
import '../datasources/experience_local_data_source.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  final ExperienceLocalDataSource localDataSource;

  ExperienceRepositoryImpl({required this.localDataSource});

  @override
  Future<ExperienceSummary> getExperience(String lang) {
    return localDataSource.getExperience(lang);
  }
}
