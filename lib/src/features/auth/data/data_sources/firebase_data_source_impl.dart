import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../models/user_model.dart';
import 'firebase_data_source.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user != null
          ? UserModel(uid: credential.user!.uid, email: credential.user!.email)
          : null;
    } on firebase_auth.FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user != null
          ? UserModel(uid: credential.user!.uid, email: credential.user!.email)
          : null;
    } on firebase_auth.FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      return user != null
          ? UserModel(
            uid: user.uid,
            email: user.email,
            firstName: user.displayName,
            lastName: user.displayName,
            photoUrl: user.photoURL,
            contactNumber: user.phoneNumber,
          )
          : null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfileImage(String profileImage) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(profileImage);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(
    String displayName,
    String contactNumber,
    String address,
  ) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateDisplayName(displayName);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
