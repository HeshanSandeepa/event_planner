import 'package:event_planner/src/features/events/data/models/post_model.dart';

abstract class PostDataSource {
  Future<List<PostModel>> fetchPosts();
}
