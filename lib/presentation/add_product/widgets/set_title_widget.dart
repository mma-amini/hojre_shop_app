import 'package:flutter/material.dart';

class SetTitleWidget extends StatelessWidget {
  const SetTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent,
          ),
          width: 20.0,
          height: 20.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
