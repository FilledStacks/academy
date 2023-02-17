import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

const double _contentWidth = 1150;
const double _contentHeight = 750;

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
            width: _contentWidth,
            height: _contentHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: _contentWidth * 0.6,
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
                        ...[
                          GradientText(
                            'MASTER\nFLUTTER',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w800,
                              fontSize: 80,
                              height: 0.95,
                            ),
                            colors: kgTitle,
                          ).scaleOnHover.moveOnHover(y: -5),
                          Text(
                            'ON THE WEB',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w800,
                              fontSize: 80,
                              height: 0.95,
                            ),
                          )
                        ],
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
                            Container(
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Enter your Email',
                                  hintStyle: GoogleFonts.openSans(
                                    color: kcLightGrey,
                                  ),
                                  filled: true,
                                  fillColor: kcMediumGrey,
                                ),
                              ),
                              width: _contentWidth * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: kcMediumGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            horizontalSpaceSmall,
                            GestureDetector(
                              onTap: viewModel.isFormValid
                                  ? viewModel.notifyMe
                                  : () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: viewModel.isFormValid
                                      ? Colors.white
                                      : Colors.grey[800],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Notify Me',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ).showCursorOnHover.scaleOnHover.moveOnHover(y: -4)
                          ],
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
                    width: _contentWidth * 0.4,
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
