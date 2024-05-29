class CheckoutDataObject {
  final DateTime selectedDay;
  final int selectedHour;
  final int selectedMinute;
  final List<String> selectedServices;
  final String repeat;
  final String addressText;
  final String phoneText;
  final String fullNameText;
  final String paymentMethod;

  CheckoutDataObject({
    required this.selectedDay,
    required this.selectedHour,
    required this.selectedMinute,
    required this.selectedServices,
    required this.repeat,
    required this.addressText,
    required this.phoneText,
    required this.fullNameText,
    required this.paymentMethod,
  });
}
