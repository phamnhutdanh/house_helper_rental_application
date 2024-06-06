class CreateBookingInput {
  final String bookingTime;
  final String repeatStatus;
  final int totalPrice;
  final String note;
  final String paymentMethod;
  final String serviceId;
  final String accountId;
  final String customerAddressId;

  CreateBookingInput({
    required this.bookingTime,
    required this.repeatStatus,
    required this.totalPrice,
    required this.note,
    required this.paymentMethod,
    required this.serviceId,
    required this.accountId,
    required this.customerAddressId,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingTime': bookingTime,
      'repeatStatus': repeatStatus,
      'totalPrice': totalPrice,
      'note': note,
      'paymentMethod': paymentMethod,
      'serviceId': serviceId,
      'accountId': accountId,
      'customerAddressId': customerAddressId,
    };
  }
}

class CreateBookingServiceDetailInput {
  final String serviceDetailId;

  CreateBookingServiceDetailInput({
    required this.serviceDetailId,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceDetailId': serviceDetailId,
    };
  }
}

class BookingGraphqlDocuments {
  static String createBookingMutation = """
    mutation Mutation(\$createBookingInput: CreateBookingInput, \$createBookingServiceDetailListInput: [CreateBookingServiceDetailInput]) {
      createBooking(createBookingInput: \$createBookingInput, createBookingServiceDetailListInput: \$createBookingServiceDetailListInput) {
        id
        bookingTime
        repeatStatus
        status
        note
        paymentMethod
        totalPrice
        createdAt
        updatedAt
        serviceId
        customerId
        customerAddressId
      }
    }
""";
}
