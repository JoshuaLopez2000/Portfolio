import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // I simulate a delay or database call
    await Future.delayed(const Duration(milliseconds: 100));
    return const ProfileModel(
      name: 'Joshua López',
      email: 'joshua.lopez.nava.dev@gmail.com',
      githubUrl: 'https://github.com/JoshuaLopez2000',
      linkedinUrl: 'https://www.linkedin.com/in/joshua-ivan-lopez-nava-77311721a',
    );
  }
}
