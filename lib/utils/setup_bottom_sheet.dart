import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/theme/btn_styles.dart';
import 'package:votex/theme/fonts.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
          controller: TextEditingController(),
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

enum BottomSheetType {
  floating,
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;
  final TextEditingController? controller;
  const _FloatingBoxBottomSheet(
      {Key? key, this.request, this.completer, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: this.controller,
            decoration: InputDecoration(
                hintText: 'Enter your password here to confirm'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: btnGreen.style,
              onPressed: () => this.completer!(
                  SheetResponse(responseData: this.controller!.text)),
              child: Text(
                'Confirm',
                style: whiteBtnText,
              ))
        ],
      ),
    );
  }
}
