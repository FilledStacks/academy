import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'payment_capture_viewmodel.dart';

class PaymentCaptureViewDesktop
    extends ViewModelWidget<PaymentCaptureViewModel> {
  const PaymentCaptureViewDesktop({super.key});

  @override
  Widget build(BuildContext context, PaymentCaptureViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
