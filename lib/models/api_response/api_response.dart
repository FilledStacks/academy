import 'package:filledstacked_academy/models/convertors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  ApiResponse._();

  factory ApiResponse({
    @Default([]) List<String> errors,
    @GenericModelConverter() @Default([]) List<T> data,
    @Default([]) List<Meta> meta,
    String? first,
    String? last,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson<T>(json);

  /// Returns true if there's at least 1 error
  bool get hasErrors => errors.isNotEmpty;

  T get singleResult => data.first;
}

@freezed
class Meta with _$Meta {
  factory Meta({
    @Default(0) int count,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
