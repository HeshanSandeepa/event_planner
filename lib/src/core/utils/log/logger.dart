import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final class Log {
  Log._();

  static final logger = Logger(
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
  );

  static l(String message) {
    Log.logger.i(message);
  }
}
