// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as String,
      title: json['title'] as String,
      modules: (json['modules'] as List<dynamic>)
          .map((e) => Module.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'modules': instance.modules,
    };

_$_Module _$$_ModuleFromJson(Map<String, dynamic> json) => _$_Module(
      id: json['id'] as String,
      title: json['title'] as String,
      leadingEmoji: json['leadingEmoji'] as String?,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModuleToJson(_$_Module instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'leadingEmoji': instance.leadingEmoji,
      'chapters': instance.chapters,
    };

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      durationInSeconds: json['durationInSeconds'] as int,
      videoUrl: json['videoUrl'] as String?,
      writtenContent: json['writtenContent'] as String?,
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'durationInSeconds': instance.durationInSeconds,
      'videoUrl': instance.videoUrl,
      'writtenContent': instance.writtenContent,
    };
