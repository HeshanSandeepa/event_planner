part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

class FetchPhotosEvent extends PhotoEvent {}