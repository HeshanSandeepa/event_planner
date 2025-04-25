import 'package:event_planner/src/features/events/data/models/post_model.dart';

import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostModel>> getPosts() async {
    return await remoteDataSource.fetchPosts();
  }
}
