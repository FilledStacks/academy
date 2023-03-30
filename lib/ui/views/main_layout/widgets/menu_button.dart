import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'menu_button_viewmodel.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
  }

  void showMenu() {
    entry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          width: 200,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(-150, 30),
            child: ViewModelBuilder<MenuButtonViewModel>.reactive(
              viewModelBuilder: () => MenuButtonViewModel(),
              builder: (context, viewModel, _) => Material(
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
                                removeMenu();
                              },
                              child: const Text(
                                'Sign out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ).showCursorOnHover,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    // Add the OverlayEntry to the Overlay.
    Overlay.of(
      context,
    ).insert(entry!);
  }

  void removeMenu() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: MaterialButton(
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () async {
            if (entry == null) {
              WidgetsBinding.instance
                  .addPostFrameCallback((timeStamp) => showMenu());
            } else {
              removeMenu();
            }
          }),
    );
  }
}
