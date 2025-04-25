import 'package:event_planner/src/features/events/data/data_sources/comment_data_source.dart';
import 'package:event_planner/src/features/events/data/models/comment_model.dart';
import 'package:event_planner/src/features/events/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CommentModel>> getComments(int postId) async {
    return await remoteDataSource.fetchComments(postId);
  }
}
