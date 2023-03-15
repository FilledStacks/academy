import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'course_details_view.desktop.dart';
import 'course_details_view.mobile.dart';
import 'course_details_viewmodel.dart';

class CourseDetailsView extends StackedView<CourseDetailsViewModel> {
  final String courseId;
  const CourseDetailsView({
    super.key,
    required this.courseId,
  });

  @override
  Widget builder(
    BuildContext context,
    CourseDetailsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CourseDetailsViewMobile(),
      desktop: (_) => const CourseDetailsViewDesktop(),
    );
  }

  @override
  CourseDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourseDetailsViewModel(courseId: courseId);
}
