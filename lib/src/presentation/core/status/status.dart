import 'package:freezed_annotation/freezed_annotation.dart';
part 'status.freezed.dart';
@freezed
abstract class Status with _$Status {
  Status._();

  factory Status.initial() = StatusInitial;
  factory Status.loading() = StatusLoading;
  factory Status.success({dynamic data}) = StatusSuccess;
  factory Status.failure(String errorMessage) = StatusFailure;
  factory Status.authFailure(String errorMessage) = StatusAuthFailure;

  dynamic get data {
    return maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
  }

  String get errorMessage {
    return maybeWhen(
      failure: (message) => message,
      authFailure: (message) => message,
      orElse: () => '',
    );
  }
}