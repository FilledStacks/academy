import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_chapter_viewmodel.dart';

class CourseChapterViewMobile extends ViewModelWidget<CourseChapterViewModel> {
  const CourseChapterViewMobile({super.key});

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
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
