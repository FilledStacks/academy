import 'package:filledstacks_academy/models/models.dart';
import 'package:stacked/stacked.dart';

class CourseChapterViewModel extends BaseViewModel {
  final String chapterId;
  final Chapter? chapter;
  CourseChapterViewModel({required this.chapterId, this.chapter});
}
