import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:event_planner/src/features/auth/domain/usecases/update_profile_image_usecase.dart';
import 'package:event_planner/src/features/auth/domain/usecases/update_profile_usecase.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_current_user_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfileImageUseCase _updateProfileImageUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  ProfileBloc({
    required UpdateProfileImageUseCase updateProfileImageUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  }) : _updateProfileImageUseCase = updateProfileImageUseCase,
       _updateProfileUseCase = updateProfileUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       super(ProfileInitial()) {
    on<UpdateProfileImage>(_onProfileImageUpdate);
    on<UpdateProfile>(_onProfileUpdate);
    on<GetCurrentProfile>(_onGetCurrentProfile);
  }

  Future<void> _onProfileImageUpdate(
    UpdateProfileImage event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      await _updateProfileImageUseCase.execute(event.imagePath);
      emit(ProfileImageUpdated());
    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }

  Future<void> _onProfileUpdate(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final displayName = '${event.firstName} ${event.lastName}';
      await _updateProfileUseCase.execute(
        displayName,
        event.contactNumber,
        event.address,
      );
      emit(ProfileUpdated());
    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }

  Future<void> _onGetCurrentProfile(
    GetCurrentProfile event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final user = await _getCurrentUserUseCase.execute();
      if (user != null) {
        emit(CurrentProfileGot(user: user));
      } else {
        throw Exception();
      }

    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }
}
