import 'package:event_planner/src/features/events/data/models/comment_model.dart';

abstract class CommentDataSource {
  Future<List<CommentModel>> fetchComments(int postId);
}
