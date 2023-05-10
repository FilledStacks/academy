import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/main_layout/widgets/menu_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

const double _kNavbarHeight = 90;

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  const MainLayoutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: DefaultTextStyle(
        style: GoogleFonts.openSans(color: Colors.white),
        child: SizedBox(
          height: screenHeight(context),
          width: viewModel.contentWidth, // kdDesktopMaxContentWidth
          child: ListView(
            children: [
              SizedBox(
                height: _kNavbarHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: viewModel.contentWidth == null ? 40 : 0,
                        ),
                        child: GestureDetector(
                          onTap: viewModel.navigateToHome,
                          child: const AcademyIcon(),
                        ).showCursorOnHover,
                      ),
                      const MenuButton(),
                    ]),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: screenHeight(context) - _kNavbarHeight,
                ),
                child: const NestedRouter(),
              )
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
