import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/payment_capture/payment_capture_view.form.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'payment_capture_viewmodel.dart';

class PaymentCaptureViewDesktop
    extends ViewModelWidget<PaymentCaptureViewModel> {
  final TextEditingController cardNumberController;
  final TextEditingController cardOwnerController;
  final TextEditingController cardExpiryController;
  final TextEditingController cardCvvController;
  const PaymentCaptureViewDesktop({
    Key? key,
    required this.cardNumberController,
    required this.cardOwnerController,
    required this.cardExpiryController,
    required this.cardCvvController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PaymentCaptureViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Column(
          children: [
            verticalSpaceLarge,
            Text(
              'Enter your card details'.toUpperCase(),
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceMedium,
            if (viewModel.showValidationMessage) ...[
              Text(
                viewModel.validationMessage!,
                style: ktsBodyLarge.copyWith(color: Colors.redAccent),
              ),
              verticalSpaceLarge,
            ],
            InputField(
              controller: cardNumberController,
              hintText: 'Card Number',
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardOwnerController,
              hintText: 'Full Name',
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardExpiryController,
              errorText: viewModel.cardExpiryValidationMessage,
              hintText: 'MM / YY',
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardCvvController,
              errorText: viewModel.cardCvvValidationMessage,
              hintText: 'CVV',
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AcademyButton(title: 'Accept', onTap: viewModel.onAccept),
                horizontalSpaceSmall,
                AcademyButton(title: 'Cancel', onTap: viewModel.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
