part of 'camera_bloc.dart';

@immutable
sealed class CameraState {}

final class CameraInitial extends CameraState {}

class PhotoTaken extends CameraState {
  final String photo;

  PhotoTaken({required this.photo});
}

class CameraError extends CameraState {
  final String message;

  CameraError({required this.message});
}
