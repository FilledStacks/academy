import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:filledstacks_academy/ui/widgets/common/input_field.dart';
import 'package:filledstacks_academy/utils/input_formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'payment_capture_viewmodel.dart';
import 'payment_capture_view.form.dart';

class PaymentCaptureViewDesktop
    extends ViewModelWidget<PaymentCaptureViewModel> {
  final TextEditingController cardCvvController;
  final TextEditingController cardExpiryController;
  final TextEditingController cardOwnerController;
  final TextEditingController cardNumberController;

  const PaymentCaptureViewDesktop({
    super.key,
    required this.cardCvvController,
    required this.cardExpiryController,
    required this.cardOwnerController,
    required this.cardNumberController,
  });

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
            InputField(
              controller: cardNumberController,
              hintText: 'Card Number',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              textInputType: TextInputType.number,
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardOwnerController,
              hintText: 'Name on Card',
              inputFormatters: [nameOnCardInputFormatter],
              textInputType: TextInputType.name,
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardExpiryController,
              errorText: viewModel.cardExpiryValidationMessage,
              hintText: 'MM / YY',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
                CardMonthInputFormatter(),
              ],
              textInputType: TextInputType.number,
            ),
            verticalSpaceSmall,
            InputField(
              controller: cardCvvController,
              errorText: viewModel.cardCvvValidationMessage,
              hintText: 'CVV',
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
