import 'package:filledstacked_academy/ui/widgets/mouse_transforms/scale_on_hover.dart';
import 'package:flutter/material.dart';

import '../ui/widgets/mouse_transforms/translate_on_hover.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      cursor: SystemMouseCursors.click,
    );
  }

  /// Moves the widget by x,y pixels on hover
  ///
  /// to move up use -y values, to move left use -x values
  Widget moveOnHover({double? x, double? y}) {
    return TranslateOnHover(
      x: x,
      y: y,
      child: this,
    );
  }

  Widget get scaleOnHover {
    return ScaleOnHover(
      child: this,
    );
  }
}
