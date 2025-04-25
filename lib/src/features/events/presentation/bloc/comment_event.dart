part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class FetchCommentsEvent extends CommentEvent {
  final int postId;

  FetchCommentsEvent({required this.postId});
}