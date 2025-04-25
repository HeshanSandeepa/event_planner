part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class FetchCommentsEvent extends CommentEvent {}