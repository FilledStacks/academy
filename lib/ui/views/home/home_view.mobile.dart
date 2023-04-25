import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:filledstacks_academy/ui/widgets/common/google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
import 'widgets/home_image.dart';
import 'widgets/home_subtitle.dart';
import 'widgets/home_title.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          children: const [
            verticalSpaceLarge,
            HomeTitle(),
            verticalSpaceTiny,
            HomeSubtitle(),
            verticalSpaceLarge,
            GoogleSignIn(),
            verticalSpaceMedium,
            HomeImage(),
          ],
        ));
  }
}
