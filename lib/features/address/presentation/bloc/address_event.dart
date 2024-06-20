part of 'address_bloc.dart';

@immutable
sealed class AddressEvent {}

final class CreateCustomerAddressEvent extends AddressEvent {
  final String address;
  final String fullName;
  final String phone;
  final String customerId;
  final bool isDefault;

  CreateCustomerAddressEvent({
    required this.address,
    required this.fullName,
    required this.phone,
    required this.customerId,
    required this.isDefault,
  });
}

final class GetAllAddressOfCustomerEvent extends AddressEvent {
  final String customerId;

  GetAllAddressOfCustomerEvent({
    required this.customerId,
  });
}

final class GetCustomerAddressByIdEvent extends AddressEvent {
  final String id;

  GetCustomerAddressByIdEvent({
    required this.id,
  });
}

final class RemoveCustomerAddressEvent extends AddressEvent {
  final String id;

  RemoveCustomerAddressEvent({
    required this.id,
  });
}

final class RemoveEmployeeAddressEvent extends AddressEvent {
  final String id;

  RemoveEmployeeAddressEvent({
    required this.id,
  });
}

final class CreateEmployeeAddressEvent extends AddressEvent {
  final String address;
  final String fullName;
  final String phone;
  final String employeeId;
  final bool isDefault;

  CreateEmployeeAddressEvent({
    required this.address,
    required this.fullName,
    required this.phone,
    required this.employeeId,
    required this.isDefault,
  });
}

final class GetAllAddressOfEmployeeEvent extends AddressEvent {
  final String employeeId;

  GetAllAddressOfEmployeeEvent({
    required this.employeeId,
  });
}
