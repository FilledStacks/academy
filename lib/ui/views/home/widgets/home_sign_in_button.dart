import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomeSignInButton extends ViewModelWidget<HomeViewModel> {
  const HomeSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: viewModel.signInWithGoogle,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 16,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: viewModel.isBusy
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : Text('Sign in with Google',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )),
      ),
    ).showCursorOnHover;
  }
}
