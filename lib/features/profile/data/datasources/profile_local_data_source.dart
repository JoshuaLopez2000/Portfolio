import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return const ProfileModel(
      name: 'Joshua López',
      email: 'joshua.lopez.nava.dev@gmail.com',
      githubUrl: 'https://github.com/JoshuaLopez2000',
      linkedinUrl: 'https://www.linkedin.com/in/joshua-ivan-lopez-nava-77311721a',
      cvEsPath: 'cv/Joshua_Lopez_CV_ES.pdf',
      cvEnPath: 'cv/Joshua_Lopez_CV_EN.pdf',
    );
  }
}
