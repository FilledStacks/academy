import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_image.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_subtitle.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_title.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_notify_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/common/academy_icon.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  final TextEditingController emailController;
  const HomeViewMobile({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          children: [
            const AcademyIcon(),
            verticalSpaceLarge,
            const HomeTitle(),
            verticalSpaceTiny,
            const HomeSubtitle(),
            verticalSpaceLarge,
            InputField(controller: emailController),
            if (viewModel.showValidationError)
              Text(
                viewModel.emailValidationMessage!,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            verticalSpaceMedium,
            const HomeNotifyButton(),
            verticalSpaceMedium,
            const HomeImage(),
          ],
        ));
  }
}
