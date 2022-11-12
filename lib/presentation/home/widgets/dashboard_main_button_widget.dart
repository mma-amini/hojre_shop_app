import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class DashboardMainButtonWidget extends StatelessWidget {
  DashboardMainButtonWidget({Key? key, required this.iconData, required this.label, required this.onTap}) : super(key: key);

  final controller = Get.find<HomeController>();
  final IconData iconData;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              iconData,
              size: 15.0,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
