import 'package:event_planner/src/features/events/data/models/comment_model.dart';
import 'package:event_planner/src/features/events/domain/repositories/comment_repository.dart';

class GetCommentUseCase {
  final CommentRepository repository;

  GetCommentUseCase({required this.repository});

  Future<List<CommentModel>> execute(int postId) async {
    return await repository.getComments(postId);
  }
}
