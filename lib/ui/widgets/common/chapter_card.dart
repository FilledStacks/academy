import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChapterCard extends StatelessWidget {
  final int position;
  final String title;
  final String description;
  final void Function()? onTap;
  final String? icon;
  const ChapterCard({
    Key? key,
    required this.position,
    required this.title,
    required this.description,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.5),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: kcMediumGrey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GradientText(
                        colors: const [
                          kcTitleGradientLeft,
                          kcTitleGradientRight
                        ],
                        position.toString().padLeft(2, '0'),
                        style: ktsTitle.copyWith(
                          fontSize: getResponsiveMediumFontSize(context),
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        title,
                        style: ktsTitle.copyWith(
                          fontSize: getResponsiveMediumFontSize(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 19),
                  Text(
                    description,
                    style: ktsBodyLarge.copyWith(
                      color: kcCourseOverview,
                      fontSize: getResponsiveSmallFontSize(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (icon != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 34,
                  minHeight: 34,
                  maxWidth: 34,
                  maxHeight: 34,
                ),
                child: Image.asset(icon!),
              ),
            ),
        ],
      ),
    ).showCursorOnHover;
  }
}
