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
    return viewModel.loadingChapter
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: const EdgeInsets.all(45),
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
                      viewModel.chapter?.title ?? 'Loading ...',
                      colors: kgTitle,
                      style: ktsTitle2,
                    ),
                  ],
                ),
                Text(
                  viewModel.chapter?.description ?? '...',
                  style: ktsBodyRegular.copyWith(color: kcLightGrey),
                ),
              ],
            ));
  }
}
