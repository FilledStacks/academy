import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

abstract class SideBarItem {
  bool isSelected(String id);
}

@freezed
class Course with _$Course {
  Course._();

  factory Course({
    required String id,
    required String title,
    required List<Module> modules,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Chapter chapterForId(String chapterId) => modules
      .map<List<Chapter>>((e) => List.from(e.chapters))
      .reduce((value, element) => value..addAll(element))
      .firstWhere((element) => element.id == chapterId);
}

@freezed
class Module with _$Module implements SideBarItem {
  Module._();

  factory Module({
    required String id,
    required String title,
    String? leadingEmoji,
    required List<Chapter> chapters,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  @override
  bool isSelected(String id) => chapters.any((element) => element.id == id);
}

@freezed
class Chapter with _$Chapter implements SideBarItem {
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

  @override
  bool isSelected(String id) => this.id == id;
}
