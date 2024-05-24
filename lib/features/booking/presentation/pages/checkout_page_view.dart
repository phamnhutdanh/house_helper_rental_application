import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/home_booking_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/address_widget.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/payment_widget.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({super.key});

  @override
  State<CheckoutPageView> createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  int currentStep = 0;
  bool isCompleted = false;
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            "Address",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: AddressWidget(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            "Complete",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: PaymentWidget(),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Checkout",
            style: TextStyle(
                color: Color(0xFFFF9505),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: isCompleted
            ? HomeBookingPage()
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(primary: Color(0xFFFF9505))),
                child: Stepper(
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      print("Completed");

                      /// send data to server
                    } else {
                      /// code
                    }
                    setState(() => currentStep += 1);
                  },
                  onStepTapped: (step) => setState(() => currentStep = step),
                  onStepCancel: currentStep == 0
                      ? null
                      : () {
                          setState(() => currentStep -= 1);
                        },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: controls.onStepContinue,
                              child: Container(
                                height: SizeConfig.screenHeight! / 13.66,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF9505),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text(
                                    isLastStep ? "Confirm" : "Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.screenHeight! / 37.95,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! / 34.25,
                          ),
                          if (currentStep != 0)
                            Expanded(
                              child: InkWell(
                                onTap: controls.onStepCancel,
                                child: Container(
                                  height: SizeConfig.screenHeight! / 13.66,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF9505),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenHeight! / 37.95,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )));
  }
}
