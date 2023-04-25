import 'package:flutter/material.dart';

import 'menu_overlay/menu_overlay.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  OverlayEntry? entry;
  final layerLink = LayerLink();

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
            (_) => entry == null ? showMenu() : removeMenu(),
          );
        },
      ),
    );
  }

  void showMenu() {
    entry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          width: 200,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(-150, 30),
            child: const MenuOverlay(),
          ),
        );
      },
    );

    // Insert overlay into layer
    Overlay.of(context).insert(entry!);
  }

  void removeMenu() {
    entry?.remove();
    entry = null;
  }
}
