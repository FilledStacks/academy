import 'package:filledstacks_academy/extensions/hover_extensions.dart';
import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'menu_overlay_viewmodel.dart';

class MenuOverlay extends StackedView<MenuOverlayViewModel> {
  final Function()? onMenuItemTapped;
  const MenuOverlay({
    super.key,
    this.onMenuItemTapped,
  });

  @override
  Widget builder(
      BuildContext context, MenuOverlayViewModel viewModel, Widget? child) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 8,
      color: kcMediumGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () async {
                      await viewModel.logout();
                      onMenuItemTapped?.call();
                    },
                    child: const Text(
                      'Sign out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ).showCursorOnHover,
        ],
      ),
    );
  }

  @override
  MenuOverlayViewModel viewModelBuilder(BuildContext context) =>
      MenuOverlayViewModel();
}
