import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

class NoticeSheet extends StatelessWidget {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title!,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),
          verticalSpaceTiny,
          Text(
            request.description!,
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            maxLines: 3,
            softWrap: true,
          ),
          verticalSpaceLarge,
          Center(
            child: MaterialButton(
              onPressed: () => completer?.call(SheetResponse(confirmed: true)),
              child: Text(
                'Close',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ).showCursorOnHover,
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
