import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import 'course_chapter_viewmodel.dart';

class CourseChapterViewDesktop extends ViewModelWidget<CourseChapterViewModel> {
  const CourseChapterViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              height: screenHeight(context) * 0.7,
              alignment: Alignment.center,
              child: Text(
                viewModel.chapterId,
                style: ktsTitle,
              ),
            ),
            verticalSpaceLarge,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('💻', style: ktsTitle2),
                horizontalSpaceSmall,
                GradientText(
                  'STACKED BASICS',
                  colors: kgTitle,
                  style: ktsTitle2,
                ),
              ],
            ),
            Text(
              'Get to know Stacked, what it provides, how to use the CLI and how it works.',
              style: ktsBodyRegular.copyWith(color: kcLightGrey),
            ),
            Container(
              color: Colors.red,
              height: screenHeight(context) * 0.7,
            ),
            verticalSpaceLarge,
            Container(
              color: Colors.red,
              height: screenHeight(context) * 0.7,
            ),
            verticalSpaceLarge,
          ],
        ));
  }
}
