import 'package:filledstacks_academy/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'google_sign_in_viewmodel.dart';

class GoogleSignIn extends StackedView<GoogleSignInViewModel> {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GoogleSignInViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: viewModel.signInWithGoogle,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: const Text(
          'Sign up with Google',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ).showCursorOnHover,
    );
  }

  @override
  GoogleSignInViewModel viewModelBuilder(BuildContext context) =>
      GoogleSignInViewModel();
}
