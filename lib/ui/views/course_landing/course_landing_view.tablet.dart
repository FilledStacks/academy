import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_landing_viewmodel.dart';

class CourseLandingViewTablet extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingViewTablet({super.key});

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return const Scaffold(
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
