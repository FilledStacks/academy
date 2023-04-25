import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'payment_capture_view.desktop.dart';
import 'payment_capture_view.form.dart';
import 'payment_capture_view.mobile.dart';
import 'payment_capture_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'cardNumber'),
    FormTextField(name: 'cardOwner'),
    FormTextField(name: 'cardExpiry'),
    FormTextField(name: 'cardCvv'),
  ],
)
class PaymentCaptureView extends StackedView<PaymentCaptureViewModel>
    with $PaymentCaptureView {
  const PaymentCaptureView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PaymentCaptureViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const PaymentCaptureViewMobile(),
      desktop: (_) => PaymentCaptureViewDesktop(
        cardNumberController: cardNumberController,
        cardOwnerController: cardOwnerController,
        cardExpiryController: cardExpiryController,
        cardCvvController: cardCvvController,
      ),
    );
  }

  @override
  PaymentCaptureViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentCaptureViewModel();

  @override
  void onViewModelReady(PaymentCaptureViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
