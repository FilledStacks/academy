import 'package:filledstacks_academy/extensions/hover_extensions.dart';
import 'package:filledstacks_academy/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeImage extends StatelessWidget {
  final Function()? onTap;
  const HomeImage({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/master-web-hero-image.png',
          width: kdDesktopMaxContentWidth * 0.4,
          // Return 650 for mobile and double.infinity on desktop
          height: getValueForScreenType<double>(
            context: context,
            mobile: 650,
            desktop: double.infinity,
          ),
          fit: BoxFit.cover,
        ),
      ).showCursorOnHover.moveOnHover(y: 4),
    );
  }
}
