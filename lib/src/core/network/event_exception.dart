import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_exception.freezed.dart';

@freezed
abstract class EventException with _$EventException {
  const factory EventException.genericException({
    @Default('GenericException') String message,
  }) = GenericException;

  const factory EventException.serverException({
    @Default('ServerException') String message,
  }) = ServerException;
}
