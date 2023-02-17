import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AcademyIcon extends StatelessWidget {
  const AcademyIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'FilledStacks Academy',
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.w800,
        fontSize: getValueForScreenType(
          context: context,
          mobile: 17,
          tablet: 15,
          desktop: 15,
        ),
      ),
    );
  }
}
