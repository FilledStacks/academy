import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/gradient_title.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/input_field.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/notify_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  final TextEditingController emailController;
  const HomeViewDesktop({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Center(
          child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: kdDesktopMaxContentWidth * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'FilledStacks Academy',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(flex: 2),
                        const HomeTitle(),
                        Row(
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
                        verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: SvgPicture.asset('assets/sign-up-arrow.svg'),
                        ),
                        verticalSpaceSmall,
                        Row(
                          children: [
                            InputField(controller: emailController),
                            horizontalSpaceSmall,
                            const NotifyButton()
                          ],
                        ),
                        if (viewModel.showValidationError)
                          Text(
                            viewModel.emailValidationMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        const Spacer(flex: 3)
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/master-web-hero-image.png',
                    width: kdDesktopMaxContentWidth * 0.4,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ).scaleOnHover.moveOnHover(y: -40),
              ],
            ),
          ),
        ));
  }
}
