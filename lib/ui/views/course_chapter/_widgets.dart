part of 'course_chapter_view.desktop.dart';

class _CourseChapterUserNotLogged
    extends ViewModelWidget<CourseChapterViewModel> {
  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: const [
                  _CourseChapterTitle(),
                  _CourseChapterSubtitle(),
                ],
              )
            ],
          ),
          const Expanded(child: SizedBox.shrink()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              const _CourseChapterArrow(),
              Column(
                children: const [
                  _CourseChapterPriceCard(),
                  _CourseChapterSignInButton(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CourseChapterTitle extends StatelessWidget {
  const _CourseChapterTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: getValueForScreenType<CrossAxisAlignment>(
        context: context,
        mobile: CrossAxisAlignment.center,
        tablet: CrossAxisAlignment.start,
        desktop: CrossAxisAlignment.start,
      ),
      children: [
        GradientText(
          'MASTER\nFLUTTER',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w800,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 40,
              tablet: 60,
              desktop: 60,
            ),
            height: 0.95,
          ),
          colors: kgTitle,
        ),
        Text(
          'ON THE WEB',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w800,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 40,
              tablet: 60,
              desktop: 60,
            ),
            height: 0.95,
          ),
        )
      ],
    );
  }
}

class _CourseChapterSubtitle extends StatelessWidget {
  const _CourseChapterSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Build amazing software, the right way.',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Text(
          'Buy This Course',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kcTitleGradientLeft,
          ),
        ),
      ],
    );
  }
}

class _CourseChapterArrow extends StatelessWidget {
  const _CourseChapterArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      height: 300,
      width: 800,
      child: SvgPicture.asset(
        'assets/sign-in-to-view.svg',
        placeholderBuilder: (context) => Shimmer.fromColors(
          baseColor: kcDarkGreyColor,
          highlightColor: kcDarkGreyShimmerEndColor,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: kcMediumGrey,
          ),
        ),
      ),
    );
  }
}

class _CourseChapterPriceCard extends StatelessWidget {
  const _CourseChapterPriceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$35',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w800,
            fontSize: getValueForScreenType(
              context: context,
              mobile: 40,
              tablet: 60,
              desktop: 60,
            ),
            height: 0.95,
          ),
        ),
        horizontalSpaceSmall,
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: kcTitleGradientRight),
                borderRadius: BorderRadius.circular(4.0),
                color: kcTitleGradientRight,
              ),
              child: Text(
                '\$20 Off',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 12,
                    tablet: 14,
                    desktop: 14,
                  ),
                  height: 0.95,
                ),
              ),
            ),
            verticalSpaceTiny,
            Text(
              '1 Week only',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 8,
                  tablet: 12,
                  desktop: 12,
                ),
                height: 0.95,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _CourseChapterSignInButton
    extends ViewModelWidget<CourseChapterViewModel> {
  const _CourseChapterSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CourseChapterViewModel viewModel) {
    return GestureDetector(
      onTap: viewModel.signInWithGoogle,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: viewModel.isBusy
            ? const CircularProgressIndicator(color: Colors.black)
            : Text('Sign in to view',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                )),
      ),
    ).showCursorOnHover;
  }
}
