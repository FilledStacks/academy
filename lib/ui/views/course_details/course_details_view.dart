import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'course_details_view.desktop.dart';
import 'course_details_view.mobile.dart';
import 'course_details_viewmodel.dart';

class CourseDetailsView extends StackedView<CourseDetailsViewModel> {
  final String courseId;
  const CourseDetailsView({
    super.key,
    @pathParam required this.courseId,
  });

  @override
  Widget builder(
    BuildContext context,
    CourseDetailsViewModel viewModel,
    Widget? child,
  ) {
    viewModel.log.w('VIEW hashCode:$hashCode courseId:$courseId');
    viewModel.log.wtf(
      'VIEWMODEL hashCode:${viewModel.hashCode} courseId:${viewModel.courseId}',
    );
    return ScreenTypeLayout.builder(
      mobile: (_) => const CourseDetailsViewMobile(),
      desktop: (_) => CourseDetailsViewDesktop(courseId: courseId),
    );
  }

  @override
  CourseDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourseDetailsViewModel(courseId: courseId);

  @override
  void onViewModelReady(CourseDetailsViewModel viewModel) {
    viewModel.log.wtf('courseId:${viewModel.courseId}');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      viewModel.enterFullscreen();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(CourseDetailsViewModel viewModel) {
    viewModel.log.wtf('courseId:${viewModel.courseId}');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      viewModel.exitFullscreen();
    });
    super.onDispose(viewModel);
  }

  // @override
  // bool get fireOnViewModelReadyOnce => false;

  // @override
  // bool get disposeViewModel => true;

  // @override
  // bool get initialiseSpecialViewModelsOnce => false;
}
