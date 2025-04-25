part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentFetched extends CommentState {
  final List<CommentModel> comments;

  CommentFetched({required this.comments});
}

class CommentError extends CommentState {
  final String message;

  CommentError({required this.message});
}
