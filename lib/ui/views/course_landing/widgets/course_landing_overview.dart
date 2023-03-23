import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/course_landing/course_landing_viewmodel.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_perks_card.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_price_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CourseLandingOverview extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 55,
          child: viewModel.fetchedCourse?.hasDescription ?? false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ksCourseDetailsTitle,
                      style: ktsTitle2.copyWith(color: kcCourseOverview),
                    ),
                    verticalSpaceSmall,
                    Text(
                      viewModel.fetchedCourse?.description ?? '',
                      style: ktsBodyLarge.copyWith(color: kcCourseOverview),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        Flexible(
          flex: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CoursePriceCard(
                price: '35',
                discountPrice: '20',
                discountPeriod: '1 Week only',
              ),
              verticalSpaceSmall,
              const AcademyButton(
                title: 'Enroll in course',
              ),
              verticalSpaceLarge,
              CoursePerksCard(
                perks: viewModel.fetchedCourse?.perks ?? [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
