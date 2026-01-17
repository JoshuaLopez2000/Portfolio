import 'features/profile/data/datasources/profile_local_data_source.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/usecases/get_profile.dart';
import 'features/projects/data/datasources/project_local_data_source.dart';
import 'features/projects/data/repositories/project_repository_impl.dart';
import 'features/projects/domain/repositories/project_repository.dart';
import 'features/projects/domain/usecases/get_projects.dart';
import 'features/skills/data/datasources/skill_local_data_source.dart';
import 'features/skills/data/repositories/skill_repository_impl.dart';
import 'features/skills/domain/repositories/skill_repository.dart';
import 'features/skills/domain/usecases/get_skills.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();

  factory ServiceLocator() {
    return _instance;
  }

  ServiceLocator._internal();

  late GetProfile getProfile;
  late GetProjects getProjects;
  late GetSkills getSkills;

  void init() {
    // I configure dependency injection for the Profile Feature.
    final ProfileLocalDataSource profileLocalDataSource = ProfileLocalDataSourceImpl();
    final ProfileRepository profileRepository = ProfileRepositoryImpl(
      localDataSource: profileLocalDataSource,
    );
    getProfile = GetProfile(profileRepository);

    // I configure dependency injection for the Projects Feature.
    final ProjectLocalDataSource projectLocalDataSource = ProjectLocalDataSourceImpl();
    final ProjectRepository projectRepository = ProjectRepositoryImpl(
      localDataSource: projectLocalDataSource,
    );
    getProjects = GetProjects(projectRepository);

    // I configure dependency injection for the Skills Feature.
    final SkillLocalDataSource skillLocalDataSource = SkillLocalDataSourceImpl();
    final SkillRepository skillRepository = SkillRepositoryImpl(
      localDataSource: skillLocalDataSource,
    );
    getSkills = GetSkills(skillRepository);
  }
}

final sl = ServiceLocator();
