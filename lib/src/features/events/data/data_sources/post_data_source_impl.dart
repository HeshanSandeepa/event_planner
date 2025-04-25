import 'package:event_planner/src/features/events/data/data_sources/post_data_source.dart';
import 'package:event_planner/src/features/events/data/models/post_model.dart';
import 'package:event_planner/src/core/network/net.dart';

class PostDataSourceImpl implements PostDataSource {
  final DioClient dioClient;

  PostDataSourceImpl({required this.dioClient});

  @override
  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await dioClient.dio().get(EndPoint.posts.getApi);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<PostModel> posts =
            jsonList.map((json) => PostModel.fromJson(json)).toList();
        return posts;
      } else {
        throw const GenericException(message: 'fetchPosts error');
      }
    } catch (e) {
      rethrow;
    }
  }
}
