import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/objects/checkout_data_object.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/pages/confirm_checkout_page.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/address_widget.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/payment_widget.dart';
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

  final _scrollController = ItemScrollController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  int _selectedRepeat = 0;
  bool _isSavingAddress = false;

  String _selectedHour = '06:30';
  String paymentRadioValue = 'COD';

  final List<String> _selectedServices = [];
  final List<String> _hours = <String>[
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

  final List<String> _repeat = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  int _currentStep = 0;
  bool _isCompleted = false;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late CheckoutDataObject checkoutDataObject;
  @override
  void initState() {
    super.initState();
    context
        .read<BookingBloc>()
        .add(BookingFetchAllCheckoutData(serviceId: widget.serviceId));

    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
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

  List<Step> getSteps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
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
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is currently selected.
                  // If this returns true, then `day` will be marked as selected.

                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
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
                    itemScrollController: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _hours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedHour = _hours[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: _selectedHour == _hours[index]
                                ? Colors.orange.shade100.withOpacity(0.5)
                                : Colors.orange.withOpacity(0),
                            border: Border.all(
                              color: _selectedHour == _hours[index]
                                  ? Colors.orange
                                  : Colors.white.withOpacity(0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _hours[index],
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
                    itemCount: _repeat.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRepeat = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedRepeat == index
                                ? AppPalette.thirdColor
                                : Colors.grey.shade100,
                          ),
                          margin: const EdgeInsets.only(right: 20),
                          child: Center(
                              child: Text(
                            _repeat[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: _selectedRepeat == index
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
              BlocConsumer<BookingBloc, BookingState>(
                listener: (BuildContext context, BookingState state) {
                  if (state is BookingFailure) {
                    showSnackBar(context, state.error);
                  }
                },
                builder: (BuildContext context, BookingState state) {
                  if (state is BookingLoading) {
                    return const Loader();
                  }
                  if (state is CheckoutInfoDisplaySuccess) {
                    final title = state.service.name ?? '';
                    return Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<BookingBloc, BookingState>(
                listener: (BuildContext context, BookingState state) {
                  if (state is BookingFailure) {
                    showSnackBar(context, state.error);
                  }
                },
                builder: (BuildContext context, BookingState state) {
                  if (state is BookingLoading) {
                    return const Loader();
                  }
                  if (state is CheckoutInfoDisplaySuccess) {
                    final serviceDetails = state.service.serviceDetails ?? [];
                    return Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppPalette.transparentColor,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: serviceDetails.length,
                        itemBuilder: (context, index) {
                          String serviceDetailId =
                              serviceDetails[index].id ?? '';
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_selectedServices
                                      .contains(serviceDetailId)) {
                                    _selectedServices.remove(serviceDetailId);
                                  } else {
                                    _selectedServices.add(serviceDetailId);
                                  }
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _selectedServices
                                            .contains(serviceDetailId)
                                        ? AppPalette.thirdColor
                                        : AppPalette.transparentColor,
                                  ),
                                  margin: const EdgeInsets.only(right: 20),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            serviceDetails[index].imageUri ??
                                                '',
                                            height: 40,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            serviceDetails[index].name ?? '',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: _selectedServices
                                                      .contains(index)
                                                  ? AppPalette.whiteColor
                                                  : Colors.grey.shade800,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${serviceDetails[index].fee ?? 0.0}VND",
                                            style: const TextStyle(
                                              color: AppPalette.blackColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )));
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
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
            isSavingAddress: _isSavingAddress,
            onChangedCheckbox: (b) {
              setState(() {
                _isSavingAddress = b;
              });
            },
          ),
        ),
        Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
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
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Checkout',
        isVisibleBackButton: true,
        onPressBack: () {
          context.read<BookingBloc>().add(BookingFetchAllHomeData());
          Beamer.of(context).beamBack();
        },
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPalette.whiteColor,
      body: _isCompleted
          ? ConfirmCheckoutPage(
              checkoutDataObject: checkoutDataObject,
            )
          : Theme(
              data: Theme.of(context).copyWith(
                  colorScheme:
                      const ColorScheme.light(primary: AppPalette.thirdColor)),
              child: Stepper(
                type: StepperType.vertical,
                steps: getSteps(),
                currentStep: _currentStep,
                onStepContinue: () {
                  final isLastStep = _currentStep == getSteps().length - 1;

                  if (isLastStep) {
                    setState(() => _isCompleted = true);
                    print("CHECKOUT_PAGE Completed");
                    print(
                        "CHECKOUT_PAGE Selected day" + _selectedDay.toString());
                    print("CHECKOUT_PAGE Selected hours" + _selectedHour);
                    print("CHECKOUT_PAGE Selected repeat" +
                        _selectedRepeat.toString());
                    print("CHECKOUT_PAGE Selected cleaning" +
                        _selectedServices.toString());
                    print("CHECKOUT_PAGE Address: " +
                        addressController.text.trim());
                    print(
                        "CHECKOUT_PAGE Phone: " + phoneController.text.trim());
                    print("CHECKOUT_PAGE Name: " +
                        fullNameController.text.trim());

                    var hours = _selectedHour.split(":");
                    print('CHECKOUT_PAGE Radio: ' + paymentRadioValue);
                    checkoutDataObject = CheckoutDataObject(
                      selectedDay: _selectedDay ?? DateTime.now(),
                      selectedHour: int.parse(hours[0]),
                      selectedMinute: int.parse(hours[1]),
                      selectedServices: _selectedServices,
                      repeat: _selectedRepeat == 0
                          ? "NO_REPEAT"
                          : _selectedRepeat == 1
                              ? "EVERY_DAY"
                              : _selectedRepeat == 2
                                  ? "EVERY_WEEK"
                                  : "EVERY_MONTH",
                      addressText: addressController.text.trim(),
                      phoneText: phoneController.text.trim(),
                      fullNameText: fullNameController.text.trim(),
                      paymentMethod: paymentRadioValue,
                    );
                    Beamer.of(context).beamToNamed('/booking_home/confirm_page',
                        data: checkoutDataObject);

                    /// send data to server
                  } else {
                    /// code
                  }
                  setState(() => _currentStep += 1);
                },
                onStepTapped: (step) => setState(() => _currentStep = step),
                onStepCancel: _currentStep == 0
                    ? null
                    : () {
                        setState(() => _currentStep -= 1);
                      },
                controlsBuilder:
                    (BuildContext context, ControlsDetails controls) {
                  final isLastStep = _currentStep == getSteps().length - 1;
                  return Container(
                    margin:
                        // EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),
                        const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        if (_currentStep != 0)
                          Expanded(
                            child: InkWell(
                              onTap: controls.onStepCancel,
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: AppPalette.greyColor,
                                    borderRadius: BorderRadius.circular(12.0)),
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
    );
  }
}
