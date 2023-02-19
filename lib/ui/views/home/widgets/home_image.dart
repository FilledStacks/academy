import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/master-web-hero-image.png',
        width: getValueForScreenType<double>(
          context: context,
          mobile: 650,
          tablet: kdDesktopMaxContentWidth * 0.4,
          desktop: kdDesktopMaxContentWidth * 0.4,
        ),
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    ).scaleOnHover().moveOnHover(
          y: getValueForScreenType(
              context: context, mobile: 10, tablet: -40, desktop: -40),
          x: getValueForScreenType(
            context: context,
            mobile: -20,
            tablet: 0,
            desktop: 0,
          ),
        );
  }
}
