import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

class GenericModelConverter<T> implements JsonConverter<T, Object?> {
  final Map<Type, Function(Map<String, dynamic>)> _converterFunctions = const {
    Chapter: Chapter.fromJson,
    Course: Course.fromJson,
    Module: Module.fromJson,
    User: User.fromJson,
  };

  const GenericModelConverter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      final conversionFunction = _converterFunctions[T];
      if (conversionFunction != null) {
        return conversionFunction(json);
      }
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  // This will only work if `object` is a native JSON type:
  //   num, String, bool, null, etc
  // Or if it has a `toJson()` function`.
  @override
  Object? toJson(T object) => object;
}
