import 'package:filledstacks_academy/extensions/hover_extensions.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:filledstacks_academy/ui/widgets/common/academy_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

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
      child: DefaultTextStyle(
        style: GoogleFonts.openSans(color: Colors.white),
        child: SizedBox(
          height: screenHeight(context),
          width: viewModel.contentWidth,
          child: ListView(
            children: [
              SizedBox(
                height: _kNavbarHeight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
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
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  height: screenHeight(context) - _kNavbarHeight,
                ),
                child:
                    const NestedRouter(), // 👈 This is where the nested content will render
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
