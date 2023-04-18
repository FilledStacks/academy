import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_landing_viewmodel.dart';
import 'widgets/course_landing_chapters_grid.dart';
import 'widgets/course_landing_overview.dart';
import 'widgets/course_landing_trailer.dart';

class CourseLandingViewDesktop extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: viewModel.isBusy
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
              ));
  }
}
