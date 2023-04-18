import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

class CourseDetailsViewTablet extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewTablet({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return const Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
