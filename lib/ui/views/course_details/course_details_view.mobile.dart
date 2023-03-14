import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

class CourseDetailsViewMobile extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewMobile({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return const Scaffold(
      body: Center(
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
