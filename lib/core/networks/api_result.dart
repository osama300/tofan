import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required dynamic data}) = _Success;
  const factory ApiResult.failure({required dynamic error}) = _Failure;
}
