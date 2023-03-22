import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_benefits_card.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_price_card.dart';
import 'package:flutter/material.dart';

class CourseLandingOverview extends StatelessWidget {
  const CourseLandingOverview({Key? key}) : super(key: key);

  static const String courseDetails = '''
The course teaches patterns, file layouts and development principles used to build the FilledStacks Academy. Yes, the website you’re using right now. 

By the end of this course you will have built the first version of the Academy with me.
  ''';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Course',
                style: ktsTitle2.copyWith(color: kcCourseOverview),
              ),
              Text(
                courseDetails,
                style: ktsBodyLarge.copyWith(color: kcCourseOverview),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              CoursePriceCard(
                price: '35',
                discountPrice: '20',
                discountPeriod: '1 Week only',
              ),
              verticalSpaceSmall,
              AcademyButton(
                title: 'Enroll in course',
              ),
              verticalSpaceLarge,
              CourseBenefitsCard(
                benefits: [
                  Benefit(
                    text: 'Lifetime Access',
                    icon: 'assets/chapter_icons/book.png',
                  ),
                  Benefit(text: '⭐️ Private Slack Support'),
                  Benefit(text: '🔥️ 75% Discount on Written Version'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
