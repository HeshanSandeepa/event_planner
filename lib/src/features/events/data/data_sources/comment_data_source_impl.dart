import 'package:event_planner/src/core/network/net.dart';
import 'package:event_planner/src/features/events/data/models/comment_model.dart';

import '../../../../core/utils/strings.dart';
import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final DioClient dioClient;

  CommentDataSourceImpl({required this.dioClient});

  @override
  Future<List<CommentModel>> fetchComments(int postId) async {
    try {
      final response =
          await dioClient.dio().get('${EndPoint.comments.getApi}$postId');

      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        List<CommentModel> commentList =
            jsonList.map((json) => CommentModel.fromJson(json)).toList();
        return commentList;
      } else {
        throw const GenericException(message: Strings.errorComments);
      }
    } catch (e) {
      rethrow;
    }
  }
}
