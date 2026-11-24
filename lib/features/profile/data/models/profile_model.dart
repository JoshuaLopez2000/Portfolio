import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.email,
    super.githubUrl,
    super.linkedinUrl,
    super.cvEsPath,
    super.cvEnPath,
  });
}
