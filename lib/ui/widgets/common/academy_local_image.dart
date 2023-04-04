import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AcademyLocalImage extends StatelessWidget {
  final String name;
  final double height;
  final double width;

  const AcademyLocalImage(
    this.name, {
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Shimmer.fromColors(
            baseColor: kcDarkGreyColor,
            highlightColor: kcDarkGreyShimmerEndColor,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: kcMediumGrey,
            ),
          ),
        ),
        Image.asset(
          name,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
