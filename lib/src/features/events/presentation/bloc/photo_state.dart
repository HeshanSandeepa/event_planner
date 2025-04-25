part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoFetched extends PhotoState {
  final List<PhotoModel> photos;

  PhotoFetched({required this.photos});
}

class PhotoError extends PhotoState {
  final String message;

  PhotoError({required this.message});
}
