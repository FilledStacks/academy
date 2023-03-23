import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class CoursePerksCard extends StatelessWidget {
  final List<String> perks;
  const CoursePerksCard({
    Key? key,
    this.perks = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return perks.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                ksCourseBenefitsCardTitle,
                style: ktsBodyLarge.copyWith(
                  color: kcCourseOverview,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceSmall,
              ListView.builder(
                shrinkWrap: true,
                itemCount: perks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      perks[index],
                      style: ktsBodyLarge.copyWith(color: kcCourseOverview),
                      textAlign: TextAlign.end,
                    ),
                  );
                },
              ),
            ],
          );
  }
}
