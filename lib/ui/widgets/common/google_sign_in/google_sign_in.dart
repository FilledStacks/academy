import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'google_sign_in_model.dart';

class GoogleSignIn extends StackedView<GoogleSignInModel> {
  final bool isBusy;
  final bool enabled;

  /// CTA name for Analytics
  final String eventName;
  final String title;
  const GoogleSignIn({
    Key? key,
    this.isBusy = false,
    this.enabled = true,
    this.eventName = ksCTASignInWithGoogle,
    this.title = ksCTASignInWithGoogle,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GoogleSignInModel viewModel,
    Widget? child,
  ) {
    return AcademyButton(
      enabled: enabled,
      isBusy: isBusy || viewModel.isBusy,
      onTap: viewModel.signInWithGoogle,
      title: title,
    );
  }

  @override
  GoogleSignInModel viewModelBuilder(BuildContext context) =>
      GoogleSignInModel(eventName: eventName);
}
