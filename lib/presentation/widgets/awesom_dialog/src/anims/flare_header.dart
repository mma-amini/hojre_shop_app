import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../awesome_dialog.dart';

class FlareHeader extends StatelessWidget {
  const FlareHeader({Key? key, required this.dialogType, required this.loop}) : super(key: key);
  final DialogType dialogType;
  final bool loop;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.INFO:
        return FlareActor(
          loop ? "assets/media/images/info.flr" : "assets/media/images/info_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
          callback: (call) {},
        );
        break;
      case DialogType.WARNING:
        return FlareActor(
          loop ? "assets/media/images/warning.flr" : "assets/media/images/warning_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
        break;
      case DialogType.ERROR:
        return FlareActor(
          loop ? "assets/media/images/error.flr" : "assets/media/images/error_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Error',
        );
        break;
      case DialogType.SUCCES:
        return FlareActor(
          loop ? "assets/media/images/succes.flr" : "assets/media/images/succes_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: 'Untitled',
        );
        break;
      default:
        return FlareActor(
          loop ? "assets/media/images/info.flr" : "assets/media/images/info_without_loop.flr",
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: 'appear',
        );
    }
  }
}
