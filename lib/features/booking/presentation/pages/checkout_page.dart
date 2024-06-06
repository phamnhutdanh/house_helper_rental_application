import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/address_widget.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/payment_widget.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/widgets/service_details_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CheckoutPage extends StatefulWidget {
  final String serviceId;
  const CheckoutPage({
    super.key,
    required this.serviceId,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();

  final scrollController = ItemScrollController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final noteController = TextEditingController();

  int selectedRepeat = 0;
  bool isSavingAddress = false;

  String selectedHour = '06:30';
  String paymentRadioValue = 'COD';

  final List<ServiceDetails> selectedServices = [];
  final List<String> hours = <String>[
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
  ];

  final List<String> repeats = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  int currentStep = 0;
  bool isCompleted = false;

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDate = DateTime.now();
  DateTime? selectedDate;

  late BookingDetailsObject bookingDetailsObject;

  @override
  void initState() {
    super.initState();
    context
        .read<ServiceBloc>()
        .add(GetServiceByIdEvent(serviceId: widget.serviceId));

    Future.delayed(const Duration(milliseconds: 500), () {
      scrollController.scrollTo(
        index: 2,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void onRefreshPreviousScreen() {
    context.read<ServiceBloc>().add(FetchAllServicesEvent());
    context.read<EmployeeBloc>().add(FetchTopEmployeesEvent());
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            "Choose time",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Column(
            children: [
              TableCalendar(
                firstDay: Constants.kFirstDay,
                lastDay: Constants.kLastDay,
                focusedDay: focusedDate,
                calendarFormat: calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(selectedDate, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      selectedDate = selectedDay;
                      focusedDate = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  focusedDate = focusedDay;
                },
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade200),
                ),
                child: ScrollablePositionedList.builder(
                    itemScrollController: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: hours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHour = hours[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: selectedHour == hours[index]
                                ? Colors.orange.shade100.withOpacity(0.5)
                                : Colors.orange.withOpacity(0),
                            border: Border.all(
                              color: selectedHour == hours[index]
                                  ? Colors.orange
                                  : Colors.white.withOpacity(0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                hours[index],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Repeat",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppPalette.whiteColor,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: repeats.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedRepeat = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedRepeat == index
                                ? AppPalette.thirdColor
                                : Colors.grey.shade100,
                          ),
                          margin: const EdgeInsets.only(right: 20),
                          child: Center(
                              child: Text(
                            repeats[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: selectedRepeat == index
                                  ? AppPalette.whiteColor
                                  : Colors.grey.shade800,
                            ),
                          )),
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<ServiceBloc, ServiceState>(
                listener: (context, state) {
                  if (state is ServiceFailure) {
                    showSnackBar(context, state.error);
                  }
                },
                builder: (context, state) {
                  if (state is BookingLoading) {
                    return const Loader();
                  }
                  if (state is ServiceDetailDisplaySuccess) {
                    final title = state.service.name ?? '';
                    final serviceDetails = state.service.serviceDetails ?? [];

                    return Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppPalette.transparentColor,
                          ),
                          child: ServiceDetailsList(
                            serviceDetails: serviceDetails,
                            onTapItem: (index) {
                              final serviceDetailId = serviceDetails[index].id;
                              setState(() {
                                if (selectedServices
                                    .map((item) => item.id)
                                    .contains(serviceDetailId)) {
                                  selectedServices.removeWhere(
                                      (item) => item.id == serviceDetailId);
                                } else {
                                  selectedServices.add(serviceDetails[index]);
                                }
                              });
                            },
                            selectedServices: selectedServices,
                          ),
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const PageName(textName: "Note"),
              InputField(
                hintText: "Note...",
                controller: noteController,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(
            "Choose address",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: AddressWidget(
            formKey: formKey,
            fullNameController: fullNameController,
            addressController: addressController,
            phoneController: phoneController,
            isSavingAddress: isSavingAddress,
            onChangedCheckbox: (b) {
              setState(() {
                isSavingAddress = b;
              });
            },
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(
            "Payment",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: PaymentWidget(
            result: paymentRadioValue,
            onChangeResult: (value) {
              setState(() {
                paymentRadioValue = value ?? '';
              });
            },
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onRefreshPreviousScreen();
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: 'Checkout',
          isVisibleBackButton: true,
          onPressBack: () {
            onRefreshPreviousScreen();
            Beamer.of(context).beamBack();
          },
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppPalette.whiteColor,
        body: isCompleted
            ? const SizedBox()
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                        primary: AppPalette.thirdColor)),
                child: Stepper(
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;

                    if (isLastStep) {
                      setState(() => isCompleted = true);

                      var hours = selectedHour.split(":");
                      selectedDate = selectedDate!.toLocal();
                      selectedDate = DateTime(
                        selectedDate!.year,
                        selectedDate!.month,
                        selectedDate!.day,
                        int.parse(hours[0]),
                        int.parse(hours[1]),
                        //  selectedDate.second,
                        //  selectedDate.millisecond,
                        //  selectedDate.microsecond,
                      );

                      int totalPrice = 0;
                      for (var element in selectedServices) {
                        totalPrice += element.fee ?? 0;
                      }

                      bookingDetailsObject = BookingDetailsObject(
                        bookingTime: selectedDate!.toIso8601String(),
                        repeatStatus: selectedRepeat == 0
                            ? "NO_REPEAT"
                            : selectedRepeat == 1
                                ? "EVERY_DAY"
                                : selectedRepeat == 2
                                    ? "EVERY_WEEK"
                                    : "EVERY_MONTH",
                        note: noteController.text.trim(),
                        paymentMethod: paymentRadioValue,
                        serviceId: widget.serviceId,
                        serviceDetails: selectedServices,
                        totalPrice: totalPrice,
                        address: addressController.text.trim(),
                        fullName: fullNameController.text.trim(),
                        phone: phoneController.text.trim(),
                        customerAddressId: '',
                      );

                      Beamer.of(context).beamToNamed(
                          '/booking_home/confirm_page',
                          data: bookingDetailsObject);

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
                          // EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),
                          const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          if (currentStep != 0)
                            Expanded(
                              child: InkWell(
                                onTap: controls.onStepCancel,
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: AppPalette.greyColor,
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: const Center(
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (currentStep != 0)
                            const SizedBox(
                              width: 20.0,
                            ),
                          Expanded(
                            child: InkWell(
                              onTap: controls.onStepContinue,
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: AppPalette.thirdColor,
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Center(
                                  child: Text(
                                    isLastStep ? "Confirm" : "Next",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
      ),
    );
  }
}
