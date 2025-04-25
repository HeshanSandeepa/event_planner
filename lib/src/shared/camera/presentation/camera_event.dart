part of 'camera_bloc.dart';

@immutable
sealed class CameraEvent {}

class TakePhotoEvent extends CameraEvent {}