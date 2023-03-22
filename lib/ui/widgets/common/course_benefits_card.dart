import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class CourseBenefitsCard extends StatelessWidget {
  final List<Benefit> benefits;
  const CourseBenefitsCard({
    Key? key,
    this.benefits = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return benefits.isEmpty
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
                itemCount: benefits.length,
                itemBuilder: (context, index) {
                  final benefit = benefits[index];

                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (benefit.icon != null) ...[
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 22,
                              maxHeight: 22,
                            ),
                            child: Image.asset(benefit.icon!),
                          ),
                          horizontalSpaceTiny,
                        ],
                        Text(
                          benefit.text,
                          style: ktsBodyLarge.copyWith(
                            color: kcCourseOverview,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
  }
}

class Benefit {
  final String? icon;
  final String text;
  const Benefit({
    this.icon,
    required this.text,
  });
}
