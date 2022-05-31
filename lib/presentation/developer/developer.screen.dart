import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/developer.controller.dart';

class DeveloperScreen extends GetView<DeveloperController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Developer'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextFormField(
                      controller: controller.domainTextController,
                      decoration: InputDecoration(
                        labelText: "Domain",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.updateDomain();
                          },
                          icon: Icon(
                            Icons.check,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
