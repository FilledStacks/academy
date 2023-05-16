import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/common/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'course_details_viewmodel.dart';

part '_widgets.dart';

const double kdSidebarWidth = 350;

class CourseDetailsViewDesktop extends ViewModelWidget<CourseDetailsViewModel> {
  final String courseId;
  const CourseDetailsViewDesktop({
    super.key,
    @pathParam required this.courseId,
  });

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    viewModel.log.w('DESKTOP BUILD hashCode:$hashCode');
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Column(
              children: [
                MaterialButton(
                  child: const Text(
                    'html-vs-canvas',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.router.push(CourseChapterViewRoute(
                      chapterId: 'html-vs-canvas',
                    ));
                  },
                ),
                MaterialButton(
                  child: const Text(
                    'seo-vs-web-app',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.router.push(CourseChapterViewRoute(
                      chapterId: 'seo-vs-web-app',
                    ));
                  },
                ),
                MaterialButton(
                  child: const Text(
                    'intro-to-stacked',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    context.router.push(CourseChapterViewRoute(
                      chapterId: 'intro-to-stacked',
                    ));
                  },
                ),
              ],
            ),
            const Expanded(child: NestedRouter()),
          ],
        ),
      ),
    );
  }
}
