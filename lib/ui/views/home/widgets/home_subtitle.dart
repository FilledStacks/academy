import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeSubtitle extends StatelessWidget {
  const HomeSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        'Build amazing software, the right way.',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      GradientText(
        ' Sign up to be notified',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        colors: kgTitle,
      ).scaleOnHover().moveOnHover(y: 5),
    ];

    return ScreenTypeLayout.builder(
      mobile: (_) => Row(children: children),
      tablet: (_) => Column(children: children),
      desktop: (_) => Column(children: children),
    );
  }
}
