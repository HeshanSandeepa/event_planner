import 'dart:convert';

import 'package:event_planner/src/core/network/net.dart';
import 'package:event_planner/src/features/events/data/models/comment_model.dart';

import 'comment_data_source.dart';

class CommentDataSourceImpl implements CommentDataSource {
  final DioClient dioClient;

  CommentDataSourceImpl({required this.dioClient});

  @override
  Future<List<CommentModel>> fetchComments() async {
    try {
      final response = await dioClient.dio().get(EndPoint.comments.getApi);
      final jsonResponse = jsonDecode(response.toString());

      if ('200' != jsonResponse['code'].toString()) {
        throw GenericException(message: 'fetchComments error');
      }
      var photoList = jsonResponse as List;
      return photoList
          .map<CommentModel>((i) => CommentModel.fromJson(i))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
