import 'package:academy/extensions/hover_extensions.dart';
import 'package:academy/ui/common/app_constants.dart';
import 'package:academy/ui/common/ui_helpers.dart';
import 'package:academy/ui/widgets/common/academy_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

// Add outside class
const double _kNavbarHeight = 90;

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  const MainLayoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      // #2: Give a default text style that matches our app style
      child: DefaultTextStyle(
        style: GoogleFonts.openSans(color: Colors.white),
        // #3: Restrict the content dimensions
        child: SizedBox(
          height: screenHeight(context),
          width: kdDesktopMaxContentWidth,
          // #4: Main body as a list
          child: ListView(
            children: [
              // Navbar
              SizedBox(
                height: _kNavbarHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: GestureDetector(
                          child: const AcademyIcon(),
                        ).showCursorOnHover,
                      ),
                      MaterialButton(
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ]),
              ),
              // Main Content
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: screenHeight(context) - _kNavbarHeight,
                ),
                child: const NestedRouter(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainLayoutViewModel();
}
