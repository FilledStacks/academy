import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class AcademyButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isBusy;
  final bool useFullWidth;
  const AcademyButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isBusy = false,
    this.useFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: useFullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: isBusy
                ? const CircularProgressIndicator(color: Colors.black)
                : Text(
                    title,
                    style: ktsBodyLarge.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: getResponsiveFontSize(context, fontSize: 18),
                    ),
                  ),
          ),
        ],
      ),
    ).showCursorOnHover;
  }
}
