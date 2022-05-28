import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dto/enums/message_type.dart';

class ShowMessage {
  static getSnackBar({
    String? title,
    required String message,
    MessageType type = MessageType.WARNING,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    SnackPosition? snackPosition = SnackPosition.TOP,
  }) {
    late Icon icon;
    late Color leftBarIndicatorColor;
    switch (type) {
      case MessageType.WARNING:
        icon = Icon(Icons.warning_outlined, color: Colors.yellow);
        leftBarIndicatorColor = Colors.yellow;
        break;
      case MessageType.ERROR:
        icon = Icon(Icons.error_outline, color: Colors.red);
        leftBarIndicatorColor = Colors.red;
        break;
      case MessageType.SUCCESS:
        icon = Icon(Icons.check_circle_outline, color: Colors.green);
        leftBarIndicatorColor = Colors.green;
        break;
      case MessageType.INFO:
        icon = Icon(Icons.info_outline, color: Colors.orange);
        leftBarIndicatorColor = Colors.orange;
        break;
      case MessageType.CONNECTION_ERROR:
        icon = Icon(Icons.error_outline, color: Colors.red);
        leftBarIndicatorColor = Colors.red;
        break;
    }

    Get.snackbar(
      title ?? "",
      message,
      titleText: Container(),
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.7),
      leftBarIndicatorColor: leftBarIndicatorColor,
      margin: const EdgeInsets.all(8.0),
      borderRadius: 0,
      barBlur: 2,
      snackPosition: snackPosition,
      icon: icon,
    );
  }

  static snackBar(
      {String? title,
      required String message,
      required BuildContext context,
      MessageType type = MessageType.WARNING,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.black}) {
    late Icon icon;
    late Color leftBarIndicatorColor;
    switch (type) {
      case MessageType.WARNING:
        icon = Icon(Icons.warning_outlined, color: Colors.yellow);
        leftBarIndicatorColor = Colors.yellow;
        break;
      case MessageType.ERROR:
        icon = Icon(Icons.error_outline, color: Colors.red);
        leftBarIndicatorColor = Colors.red;
        break;
      case MessageType.SUCCESS:
        icon = Icon(Icons.check_circle_outline, color: Colors.green);
        leftBarIndicatorColor = Colors.green;
        break;
      case MessageType.INFO:
        icon = Icon(Icons.info_outline, color: Colors.orange);
        leftBarIndicatorColor = Colors.orange;
        break;
      case MessageType.CONNECTION_ERROR:
        icon = Icon(Icons.error_outline, color: Colors.red);
        leftBarIndicatorColor = Colors.red;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 50.0,
          child: Row(
            children: [
              Container(
                height: 50.0,
                width: 5.0,
                decoration: BoxDecoration(
                  color: leftBarIndicatorColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: (title ?? "").isNotEmpty,
                          child: Column(
                            children: [
                              Text(
                                title ?? "",
                                style: TextStyle(
                                  color: textColor,
                                  fontFamily: "Vazir Reg",
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            color: textColor,
                            fontFamily: "Vazir Reg",
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
