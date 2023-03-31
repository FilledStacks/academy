import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';

class AcademyButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isBusy;
  final bool useFullWidth;
  final bool enabled;
  const AcademyButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isBusy = false,
    this.useFullWidth = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
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
              color: enabled ? Colors.white : Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: isBusy
                ? const CircularProgressIndicator(color: Colors.black)
                : Text(
                    title,
                    style: ktsBodyLarge.copyWith(
                      color: enabled
                          ? Colors.black
                          : Colors.black.withOpacity(0.25),
                      fontWeight: enabled ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
          ),
        ],
      ),
    ).showCursorOnHover;
  }
}
