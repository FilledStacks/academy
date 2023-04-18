import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/shared_styles.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CoursePriceCard extends StatelessWidget {
  final String price;
  final String discountPrice;
  final String discountPeriod;
  const CoursePriceCard({
    Key? key,
    required this.price,
    required this.discountPrice,
    required this.discountPeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\$$price',
          style: ktsTitle2.copyWith(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 50,
              tablet: 72,
              desktop: 72,
            ),
          ),
        ),
        horizontalSpaceSmall,
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: kcTitleGradientRight),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: kcTitleGradientRight.withOpacity(0.25),
                    spreadRadius: 10,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
                color: kcTitleGradientRight,
              ),
              child: Text(
                '\$$discountPrice Off',
                style: ktsBodyRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: getValueForScreenType(
                    context: context,
                    mobile: 12,
                    tablet: 16,
                    desktop: 16,
                  ),
                ),
              ),
            ),
            verticalSpace(2),
            Text(
              discountPeriod,
              style: ktsBodyRegular.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 8,
                  tablet: 12,
                  desktop: 12,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
