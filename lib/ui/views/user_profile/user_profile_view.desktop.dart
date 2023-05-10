import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_viewmodel.dart';

class UserProfileViewDesktop extends ViewModelWidget<UserProfileViewModel> {
  const UserProfileViewDesktop({super.key});

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'PROFILE VIEW NEEDS DESIGN',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            if (viewModel.hasUser)
              Text(
                viewModel.currentUser?.fullName ?? '',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            verticalSpaceSmall,
            AcademyButton(
              title: 'Payment Capture',
              onTap: viewModel.navigateToPaymentCapture,
            ),
            verticalSpaceSmall,
            AcademyButton(title: 'Go back HOME', onTap: viewModel.goBack),
          ],
        ),
      ),
    );
  }
}
