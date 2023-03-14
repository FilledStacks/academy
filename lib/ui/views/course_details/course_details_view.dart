import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'course_details_view.desktop.dart';
import 'course_details_view.mobile.dart';
import 'course_details_viewmodel.dart';

class CourseDetailsView extends StackedView<CourseDetailsViewModel> {
  final String id;
  final String? chapterId;
  const CourseDetailsView({
    super.key,
    @PathParam('id') required this.id,
    @PathParam('chapterId') this.chapterId,
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
      CourseDetailsViewModel();
}
