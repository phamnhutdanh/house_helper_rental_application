import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

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

class EmployeeAcceptBookingInput {
  final String bookingId;
  final String employeeId;

  EmployeeAcceptBookingInput({
    required this.bookingId,
    required this.employeeId,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'employeeId': employeeId,
    };
  }
}

class ChangeBookingStatusInput {
  final String id;
  final BookingStatus bookingStatus;

  ChangeBookingStatusInput({
    required this.id,
    required this.bookingStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingStatus': bookingStatus == BookingStatus.PENDING
          ? "PENDING"
          : bookingStatus == BookingStatus.ACCEPTED
              ? "ACCEPTED"
              : bookingStatus == BookingStatus.CANCELED
                  ? "CANCELED"
                  : "COMPLETED",
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

  static String getAllBookingOfCustomerQuery = """
    query GetAllBookingOfCustomer(\$customerId: String) {
      getAllBookingOfCustomer(customerId: \$customerId) {
        id
        bookingTime
        status
        service {
          id
          name
        }
        totalPrice
      }
    }
""";

  static String getAllBookingQuery = """
query GetAllBooking(\$employeeId: String) {
  getAllBooking(employeeId: \$employeeId) {
        id
        bookingTime
        status
        employeeId
        service {
          id
          name
        }
        totalPrice
  }
}
""";

  static String getBookingByIdQuery = """
  query GetBookingById(\$id: String) {
      getBookingById(id: \$id) {
        id
        customerAddress {
          address {
            id
            address
            fullName
            phone 
          }
        }
        bookingTime
        paymentMethod
        repeatStatus
        note
        totalPrice
        status
        ratingEmployee {
          score
          comment
          bookingId
          customerId
          customer {
            name
            phoneNumber
            imageUri
          }
        }
        employeeId
        bookingServiceDetails {
          serviceDetails {
            id
            imageUri
            name
            fee
          }
        }
      }
    }
""";

  static String changeBookingStatusMutation = """
    mutation ChangeBookingStatus(\$changeBookingStatusInput: ChangeBookingStatusInput) {
      changeBookingStatus(changeBookingStatusInput: \$changeBookingStatusInput) {
        id
        status
      }
    }
""";

  static String employeeAcceptBookingMutation = """
    mutation EmployeeAcceptBooking(\$employeeAcceptBookingInput: EmployeeAcceptBookingInput) {
  employeeAcceptBooking(employeeAcceptBookingInput: \$employeeAcceptBookingInput) {
     id
    status
  }
}
""";
}
