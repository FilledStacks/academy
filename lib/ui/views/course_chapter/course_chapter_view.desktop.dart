import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/widgets/common/course_price_card.dart';
import 'package:filledstacked_academy/ui/widgets/common/google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'course_chapter_viewmodel.dart';

part '_widgets.dart';

class CourseChapterViewDesktop extends ViewModelWidget<CourseChapterViewModel> {
  final String chapterId;
  const CourseChapterViewDesktop({
    super.key,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    final courseId =
        context.router.parent()?.current.pathParams.optString('courseId');

    return Scaffold(
      body: Center(
        child: Text(
          'Course: $courseId, Chapter:$chapterId',
          style: const TextStyle(color: Colors.pinkAccent, fontSize: 60),
        ),
      ),
    );
  }
}
