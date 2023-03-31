import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/views/main_layout/widgets/menu_button.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  const MainLayoutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: SizedBox(
          height: 1400,
          width: viewModel.contentWidth,
          child: ListView(
            children: [
              SizedBox(
                height: 90,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                viewModel.contentWidth == null ? 40 : 0),
                        child: GestureDetector(
                          onTap: viewModel.navigateToHome,
                          child: const AcademyIcon(),
                        ).showCursorOnHover,
                      ),
                      const MenuButton(),
                    ]),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 900),
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
