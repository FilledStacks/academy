import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: getValueForScreenType<CrossAxisAlignment>(
        context: context,
        mobile: CrossAxisAlignment.center,
        tablet: CrossAxisAlignment.start,
        desktop: CrossAxisAlignment.start,
      ),
      children: [
        GradientText(
          'MASTER\nFLUTTER',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w800,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 60,
              tablet: 80,
              desktop: 80,
            ),
            height: 0.95,
          ),
          colors: kgTitle,
        ).scaleOnHover.moveOnHover(
              y: -5,
              x: getValueForScreenType<double>(
                context: context,
                mobile: -20,
                tablet: 0,
                desktop: 0,
              ),
            ),
        Text(
          'ON THE WEB',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w800,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 60,
              tablet: 80,
              desktop: 80,
            ),
            height: 0.95,
          ),
        )
      ],
    );
  }
}
