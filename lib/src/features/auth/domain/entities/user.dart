class UserEntity {
  final String? uid;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? contactNumber;
  final String? photoUrl;

  UserEntity({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
    this.contactNumber,
    this.photoUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          contactNumber == other.contactNumber &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      photoUrl.hashCode ^
      contactNumber.hashCode;
}
