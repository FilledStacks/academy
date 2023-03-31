import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  const InputField({
    super.key,
    required this.controller,
    this.errorText,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextField(
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
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
        ),
        if (errorText != null) ...[
          verticalSpaceTiny,
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              errorText!,
              style: ktsBodyRegular.copyWith(
                color: Colors.red,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
