import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  final TextEditingController emailController;
  const HomeViewMobile({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          children: [
            Text(
              'FilledStacks Academy',
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
            verticalSpaceLarge,
            Column(
              children: [
                GradientText(
                  'MASTER\nFLUTTER',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 60,
                    height: 0.95,
                  ),
                  colors: kgTitle,
                ).scaleOnHover.moveOnHover(y: -5, x: -20),
                Text(
                  'ON THE WEB',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 60,
                    height: 0.95,
                  ),
                )
              ],
            ),
            verticalSpaceTiny,
            Column(
              children: [
                Text(
                  'Build amazing software, the right way.',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                GradientText(
                  ' Sign up to be notified',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  colors: kgTitle,
                ).scaleOnHover.moveOnHover(y: 5),
              ],
            ),
            verticalSpaceLarge,
            Container(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Enter your Email',
                  hintStyle: GoogleFonts.openSans(
                    color: kcLightGrey,
                  ),
                  filled: true,
                  fillColor: kcMediumGrey,
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: kcMediumGrey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            verticalSpaceMedium,
            GestureDetector(
              onTap: viewModel.enableNotifyButton ? viewModel.notifyMe : () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: viewModel.enableNotifyButton
                      ? Colors.white
                      : Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: viewModel.isBusy
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Text(
                        'Notify Me',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
              ),
            ).showCursorOnHover.scaleOnHover.moveOnHover(y: -4, x: -20),
            verticalSpaceMedium,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/master-web-hero-image.png',
                height: 650,
                fit: BoxFit.cover,
              ),
            ).scaleOnHover.moveOnHover(y: 10, x: -20)
          ],
        ));
  }
}
