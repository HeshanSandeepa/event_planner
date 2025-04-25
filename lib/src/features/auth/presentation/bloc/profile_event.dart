part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class UpdateProfileImage extends ProfileEvent {
  final String imagePath;

  UpdateProfileImage({required this.imagePath});
}

class UpdateProfile extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String address;

  UpdateProfile({
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.address,
  });
}

class GetCurrentProfile extends ProfileEvent {}
