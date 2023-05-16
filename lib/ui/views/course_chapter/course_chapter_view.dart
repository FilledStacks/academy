import 'package:filledstacked_academy/models/models.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'course_chapter_view.desktop.dart';
import 'course_chapter_view.mobile.dart';
import 'course_chapter_viewmodel.dart';

class CourseChapterView extends StackedView<CourseChapterViewModel> {
  final String chapterId;
  final Chapter? chapter;
  const CourseChapterView({
    super.key,
    @PathParam('chapterId') required this.chapterId,
    this.chapter,
  });

  @override
  Widget builder(
    BuildContext context,
    CourseChapterViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CourseChapterViewMobile(),
      desktop: (_) => CourseChapterViewDesktop(chapterId: chapterId),
    );
  }

  @override
  CourseChapterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourseChapterViewModel(chapterId: chapterId, chapter: chapter);
}
