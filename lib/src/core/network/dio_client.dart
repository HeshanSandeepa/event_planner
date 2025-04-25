import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:event_planner/src/core/utils/log/logger.dart';

@singleton
class DioClient {
  Dio dio() {
    Dio instance = Dio();
    instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Log.l('${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Log.l('$response');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          Log.l('$e');
          return handler.next(e);
        },
      ),
    );
    return instance;
  }
}
