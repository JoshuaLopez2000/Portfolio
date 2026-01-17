import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_local_data_source.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource localDataSource;

  ProjectRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Project>> getProjects({String lang = 'en'}) async {
    // I retrieve the project list from the local data source.
    return await localDataSource.getProjects(lang);
  }
}
