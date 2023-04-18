import 'package:filledstacks_academy/ui/common/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeSubtitle extends StatelessWidget {
  const HomeSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        'Build amazing software, the right way.',
        style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w600),
      ),
      GradientText(
        ' Sign up to be notified',
        style: ktsBodyLarge.copyWith(fontWeight: FontWeight.w600),
        colors: const [Color(0xff0CFF60), Color(0xff0091FB)],
      )
    ];
    return ScreenTypeLayout.builder(
      mobile: (_) => Column(children: children),
      desktop: (_) => Row(children: children),
    );
  }
}
