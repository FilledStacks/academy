// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse<T> _$$_ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    _$_ApiResponse<T>(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      data: (json['data'] as List<dynamic>?)
              ?.map(GenericModelConverter<T>().fromJson)
              .toList() ??
          const [],
      meta: (json['meta'] as List<dynamic>?)
              ?.map((e) => Meta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      first: json['first'] as String?,
      last: json['last'] as String?,
    );

Map<String, dynamic> _$$_ApiResponseToJson<T>(_$_ApiResponse<T> instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data.map(GenericModelConverter<T>().toJson).toList(),
      'meta': instance.meta,
      'first': instance.first,
      'last': instance.last,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'count': instance.count,
    };
