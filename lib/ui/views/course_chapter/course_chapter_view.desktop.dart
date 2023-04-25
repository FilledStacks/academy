import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/shared_styles.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import 'course_chapter_viewmodel.dart';

class CourseChapterViewDesktop extends ViewModelWidget<CourseChapterViewModel> {
  const CourseChapterViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight(context) * 0.7,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/master-web-hero-image.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Text(
                      viewModel.chapterId,
                      style: ktsTitle,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceLarge,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('💻', style: ktsTitle2),
                horizontalSpaceSmall,
                GradientText(
                  viewModel.chapter?.title ?? '',
                  colors: kgTitle,
                  style: ktsTitle2,
                ),
              ],
            ),
            Text(
              viewModel.chapter?.description ?? '',
              style: ktsBodyRegular.copyWith(color: kcLightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
