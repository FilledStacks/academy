import 'package:filledstacks_academy/ui/common/app_strings.dart';
import 'package:filledstacks_academy/ui/common/shared_styles.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:filledstacks_academy/ui/views/course_landing/course_landing_viewmodel.dart';
import 'package:filledstacks_academy/ui/widgets/common/chapter_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourseLandingChaptersGrid
    extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingChaptersGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ksCourseChapterGridTitle, style: ktsTitle2),
        verticalSpaceMedium,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            childAspectRatio: 2,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: viewModel.chapters.length,
          itemBuilder: (context, index) => ChapterCard(
            position: index + 1,
            title: viewModel.chapters[index].title,
            description: viewModel.chapters[index].description,
            onTap: () => viewModel.navigateToChapter(viewModel.chapters[index]),
          ),
        ),
      ],
    );
  }
}
