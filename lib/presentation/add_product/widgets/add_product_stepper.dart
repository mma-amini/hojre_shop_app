import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../generated/locales.g.dart';
import '../controllers/add_product.controller.dart';
import 'add_product_basic_specification_step.dart';
import 'add_product_image_step.dart';
import 'add_product_other_specification_step.dart';

class AddProductStepper extends StatelessWidget {
  AddProductStepper({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? 600 : null,
        child: Stepper(
          type: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? StepperType.horizontal : StepperType.vertical,
          physics: const ScrollPhysics(),
          currentStep: controller.currentStep.value,
          onStepTapped: (step) {
            controller.updateCurrentStep(step: step);
          },
          onStepCancel: () {
            Get.back();
          },
          onStepContinue: () {
            if (controller.currentStep.value < 2) {
              controller.currentStep.value++;
            }
          },
          // controlsBuilder: (context, controlDetail) {
          //   return Column(
          //     children: [
          //       SizedBox(
          //         height: 16.0,
          //       ),
          //       Row(
          //         children: [
          //           InkWell(
          //             borderRadius: BorderRadius.circular(8.0),
          //             onTap: () {},
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(8.0),
          //                 color: Colors.green,
          //               ),
          //               width: 75.0,
          //               padding: EdgeInsets.all(8.0),
          //               child: Center(child: Text("ادامه")),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 24.0,
          //           ),
          //           InkWell(
          //             borderRadius: BorderRadius.circular(8.0),
          //             onTap: () {},
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(8.0),
          //                 color: Colors.red,
          //               ),
          //               width: 75.0,
          //               padding: EdgeInsets.all(8.0),
          //               child: Center(child: Text("لغو")),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   );
          // },
          steps: [
            Step(
              title: Text(
                LocaleKeys.screen_add_product_choose_product_pictures.tr,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              content: AddProductImageStep(),
              // content: Container(),
            ),
            Step(
              title: Text(
                LocaleKeys.screen_add_product_registration_basic_specifications.tr,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              content: AddProductBasicSpecificationStep(),
              // content: Container(),
            ),
            Step(
              title: Text(
                LocaleKeys.screen_add_product_registration_other_specification.tr,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              content: AddProductOtherSpecificationStep(),
              // content: Container(),
            ),
          ],
        ),
      );
    });
  }
}
