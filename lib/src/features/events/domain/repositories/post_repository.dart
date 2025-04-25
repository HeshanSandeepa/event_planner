import 'package:event_planner/src/features/events/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}
