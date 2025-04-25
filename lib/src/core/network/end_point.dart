import 'package:event_planner/env.dart';

enum EndPoint { photos, users, comments, posts }

extension EndPointExtension on EndPoint {
  String get getApi {
    String api = '';

    switch (this) {
      case EndPoint.photos:
        api = 'photos?_start=0&_limit=10';
        break;

      case EndPoint.users:
        api = 'users?_start=0&_limit=3';
        break;

      case EndPoint.posts:
        api = 'posts';
        break;

      case EndPoint.comments:
        api = 'comments?postId=';
        break;
    }
    return '${Env.base}$api';
  }
}
