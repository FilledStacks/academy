import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'payment_capture_view.desktop.dart';
import 'payment_capture_view.tablet.dart';
import 'payment_capture_view.mobile.dart';
import 'payment_capture_viewmodel.dart';

class PaymentCaptureView extends StackedView<PaymentCaptureViewModel> {
  const PaymentCaptureView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PaymentCaptureViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const PaymentCaptureViewMobile(),
      tablet: (_) => const PaymentCaptureViewTablet(),
      desktop: (_) => const PaymentCaptureViewDesktop(),
    );
  }

  @override
  PaymentCaptureViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentCaptureViewModel();
}
