import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Course with _$Course {
  factory Course({
    required String id,
    required String title,
    required List<Module> modules,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class Module with _$Module {
  factory Module({
    required String id,
    required String title,
    required List<Chapter> chapters,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  Chapter._();

  factory Chapter({
    required String id,
    required String title,
    required String description,
    required int durationInSeconds,
    String? videoUrl,
    String? writtenContent,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  String get durationReadableTime {
    final duration = Duration(seconds: durationInSeconds);

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes";
  }
}
