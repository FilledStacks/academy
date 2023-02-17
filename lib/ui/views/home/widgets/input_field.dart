import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  const InputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: 'Enter your Email',
          hintStyle: GoogleFonts.openSans(
            color: kcLightGrey,
          ),
          filled: true,
          fillColor: kcMediumGrey,
        ),
      ),
      width: getValueForScreenType<double>(
        context: context,
        mobile: double.infinity,
        tablet: kdDesktopMaxContentWidth * 0.3,
        desktop: kdDesktopMaxContentWidth * 0.3,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: kcMediumGrey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
