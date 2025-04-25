import 'package:event_planner/src/features/events/data/models/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> getComments();
}
