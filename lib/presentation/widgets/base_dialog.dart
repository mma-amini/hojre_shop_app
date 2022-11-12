import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/dto/enums/message_type.dart';

class BaseDialog extends StatelessWidget {
  final String? massage;
  final MessageType messageType;
  final String btnOkText;
  final String btnCancelText;
  final Function? btnOkOnTap;
  final Function? btnCancelOnTap;
  final bool showOkBtn;

  const BaseDialog({
    Key? key,
    this.massage,
    this.messageType = MessageType.INFO,
    this.btnOkText = "باشه",
    this.btnOkOnTap,
    this.btnCancelText = "بستن",
    this.btnCancelOnTap,
    this.showOkBtn = true,
  }) : super(key: key);

  /// this function will show the error dialog.
  showBaseDialog() async {
    BuildContext _context;
    _context = Get.context!;
    await showDialog(
      barrierDismissible: false,
      context: _context,
      builder: (context) => BaseDialog(
        btnOkOnTap: btnOkOnTap,
        massage: massage,
        btnCancelText: btnCancelText,
        btnCancelOnTap: btnCancelOnTap,
        btnOkText: btnOkText,
        messageType: messageType,
        showOkBtn: showOkBtn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 0),
      buttonPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      actions: [
        _alertDialogActions,
      ],
      content: _alertDialogContent,
    );
  }

  Widget get _alertDialogActions => Column(
        children: [
          Divider(
            color: Color(0xffF1F1F1),
            height: 1,
          ),
          Container(
            height: 48.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: showOkBtn,
                  child: _actionButton,
                ),
                Visibility(
                  visible: showOkBtn,
                  child: VerticalDivider(
                    color: Color(0xffF1F1F1),
                  ),
                ),
                _closeButton,
              ],
            ),
          ),
        ],
      );

  Widget get _alertDialogContent => Container(
        constraints: BoxConstraints(maxHeight: 250.0),
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Constants.smallVerticalSize,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Image.asset(
                _setDialogHeaderImage(),
                height: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                massage ?? "",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontFamily: "Vazir Med",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      );

  Widget get _actionButton => Expanded(
        flex: 1,
        child: TextButton(
          onPressed: () {
            if (btnOkOnTap != null) {
              btnOkOnTap!();
            }
          },
          child: Text(
            btnOkText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: "Vazir Bold",
            ),
          ),
        ),
      );

  Widget get _closeButton => Expanded(
        flex: 1,
        child: TextButton(
          onPressed: () {
            if (btnCancelOnTap != null) {
              btnCancelOnTap!.call();
            }
            Get.back();
          },
          child: Text(
            btnCancelText,
            style: TextStyle(
              color: Color(0xff222222),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "Vazir Bold",
            ),
          ),
        ),
      );

  String _setDialogHeaderImage() {
    switch (messageType) {
      case MessageType.SUCCESS:
        return "assets/media/images/success.png";
      case MessageType.INFO:
        return "assets/media/images/info.png";
      case MessageType.WARNING:
        return "assets/media/images/warning.png";
      case MessageType.ERROR:
        return "assets/media/images/error.png";
      case MessageType.CONNECTION_ERROR:
        return "assets/media/images/connection_error.png";
    }
  }
}
