import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_chapters_grid.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_overview.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_trailer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_landing_viewmodel.dart';

class CourseLandingViewDesktop extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return viewModel.isBusy
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CourseLandingTrailer(),
                verticalSpaceLarge,
                CourseLandingOverview(),
                verticalSpaceLarge,
                CourseLandingChaptersGrid(),
                verticalSpaceLarge,
              ],
            ),
          );
  }
}
