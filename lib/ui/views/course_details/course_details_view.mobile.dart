import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

class CourseDetailsViewMobile extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewMobile({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: const Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
