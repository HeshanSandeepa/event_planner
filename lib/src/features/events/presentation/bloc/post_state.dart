part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostsFetched extends PostState {
  final List<PostModel> posts;

  PostsFetched({required this.posts});
}

class PostsError extends PostState {
  final String message;

  PostsError({required this.message});
}
