import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'unknown_viewmodel.dart';

class UnknownViewMobile extends ViewModelWidget<UnknownViewModel> {
  const UnknownViewMobile({super.key});

  @override
  Widget build(BuildContext context, UnknownViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: ktsTitle.copyWith(letterSpacing: 20.0),
            ),
            verticalSpaceSmall,
            Text(
              'PAGE NOT FOUND',
              style: ktsBodyLarge.copyWith(
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
