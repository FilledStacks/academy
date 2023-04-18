import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'unknown_viewmodel.dart';

class UnknownViewTablet extends ViewModelWidget<UnknownViewModel> {
  const UnknownViewTablet({super.key});

  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '404',
              style: TextStyle(
                  fontSize: 80,
                  height: 0.95,
                  color: Colors.white,
                  letterSpacing: 20.0),
            ),
            verticalSpaceSmall,
            Text(
              'PAGE NOT FOUND',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 20.0,
                wordSpacing: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
