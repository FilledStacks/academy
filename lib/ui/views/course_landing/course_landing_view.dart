import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'course_landing_view.desktop.dart';
import 'course_landing_view.mobile.dart';
import 'course_landing_viewmodel.dart';

class CourseLandingView extends StackedView<CourseLandingViewModel> {
  const CourseLandingView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CourseLandingViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CourseLandingViewMobile(),
      desktop: (_) => const CourseLandingViewDesktop(),
    );
  }

  @override
  CourseLandingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CourseLandingViewModel(courseId: 'flutter-web');
}
