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
    @pathParam required this.chapterId,
    // @PathParam('chapterId') required this.chapterId,
    this.chapter,
  });

  @override
  Widget builder(
    BuildContext context,
    CourseChapterViewModel viewModel,
    Widget? child,
  ) {
    viewModel.log.w(
      'VIEW hashCode:$hashCode, chapterId:$chapterId, chapter:$chapter',
    );
    viewModel.log.wtf(
      'VIEWMODEL hashCode:${viewModel.hashCode}, chapterId:${viewModel.chapterId}, chapter:${viewModel.chapter}',
    );
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

  @override
  void onViewModelReady(CourseChapterViewModel viewModel) {
    viewModel.log.wtf('chapterId:${viewModel.chapterId}');
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CourseChapterViewModel viewModel) {
    viewModel.log.wtf('chapterId:${viewModel.chapterId}');
    super.onDispose(viewModel);
  }

  // @override
  // bool get fireOnViewModelReadyOnce => false;

  // @override
  // bool get disposeViewModel => true;

  // @override
  // bool get initialiseSpecialViewModelsOnce => false;
}
