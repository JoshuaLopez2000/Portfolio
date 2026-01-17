import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // I simulate a delay or database call
    await Future.delayed(const Duration(milliseconds: 100));
    return ProfileModel(
      name: 'Joshua Lopez',
      email: 'joshualopez2000@hotmail.com',
    );
  }
}
