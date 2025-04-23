import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:tap_bill/controllers/new_bill%20_controller.dart';

class NewBillPage extends StatelessWidget {
  final ctrl = Get.find<NewBillController>();

  final List<Widget> steps = [
    Center(child: Text('Step 1: Customer Info')),
    Center(child: Text('Step 2: Items')),
    Center(child: Text('Step 3: Confirm')),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: Text("New Bill")),
          body: Column(
            children: [
              EasyStepper(
                activeStep: ctrl.currentStep.value,
                onStepReached: ctrl.goToStep,
                steps: [
                  EasyStep(title: 'Customer', icon: Icon(Icons.person)),
                  EasyStep(title: 'Items', icon: Icon(Icons.list)),
                  EasyStep(title: 'Confirm', icon: Icon(Icons.check)),
                ],
              ),
              Expanded(child: steps[ctrl.currentStep.value]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: ctrl.previousStep,
                    child: Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: ctrl.nextStep,
                    child: Text("Next"),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ));
  }
}
