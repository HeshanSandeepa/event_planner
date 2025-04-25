import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/camera_output_repository.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraOutputRepository _cameraOutputRepository;

  CameraBloc({required CameraOutputRepository cameraOutputRepository})
    : _cameraOutputRepository = cameraOutputRepository,
      super(CameraInitial()) {
    on<TakePhotoEvent>(_onTakePhotoEvent);
  }

  Future<void> _onTakePhotoEvent(
    TakePhotoEvent event,
    Emitter<CameraState> emit,
  ) async {
    try {
      String picturePath = await _cameraOutputRepository.takePicture();
      emit(PhotoTaken(photo: picturePath));
    } catch (e) {
      emit(CameraError(message: e.toString()));
    }
  }
}
