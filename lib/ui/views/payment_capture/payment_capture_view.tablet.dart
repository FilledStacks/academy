import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'payment_capture_viewmodel.dart';

class PaymentCaptureViewTablet
    extends ViewModelWidget<PaymentCaptureViewModel> {
  const PaymentCaptureViewTablet({super.key});

  @override
  Widget build(BuildContext context, PaymentCaptureViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
