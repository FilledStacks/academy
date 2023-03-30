import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

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
      // Create a new OverlayEntry.
      builder: (BuildContext context) {
        // Align is used to position the highlight overlay
        // relative to the NavigationBar destination.
        return Positioned(
          width: 200,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(-150, 30),
            child: Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 8,
              color: kcMediumGrey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: MaterialButton(
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            if (entry == null) {
              WidgetsBinding.instance
                  .addPostFrameCallback((timeStamp) => showMenu());
            } else {
              entry?.remove();
              entry = null;
            }
          }),
    );
  }
}
