import 'package:flutter/material.dart';

import 'menu_overlay.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  OverlayEntry? entry;
  final layerLink = LayerLink();

  void showMenu() {
    entry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          width: 200,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(-150, 30),
            child: MenuOverlay(
              onMenuItemTapped: () => removeMenu(),
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
            WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) => entry == null ? showMenu() : removeMenu());
          }),
    );
  }
}
