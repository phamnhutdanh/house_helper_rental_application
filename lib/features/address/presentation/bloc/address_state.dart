part of 'address_bloc.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressFailure extends AddressState {
  final String error;
  AddressFailure(this.error);
}

final class CreateCustomerAddressSuccess extends AddressState {
  final CustomerAddress customerAddress;
  CreateCustomerAddressSuccess(this.customerAddress);
}

final class FetchAllAddressOfCustomerDisplaySuccess extends AddressState {
  final List<CustomerAddress> customerAddresses;
  FetchAllAddressOfCustomerDisplaySuccess(this.customerAddresses);
}

final class GetCustomerAddressByIdDisplaySuccess extends AddressState {
  final CustomerAddress customerAddress;
  GetCustomerAddressByIdDisplaySuccess(this.customerAddress);
}

final class RemoveCustomerAddressSuccess extends AddressState {
  final CustomerAddress customerAddress;
  RemoveCustomerAddressSuccess(this.customerAddress);
}

final class CreateEmployeeAddressSuccess extends AddressState {
  final EmployeeAddress employeeAddress;
  CreateEmployeeAddressSuccess(this.employeeAddress);
}

final class FetchAllAddressOfEmployeeDisplaySuccess extends AddressState {
  final List<EmployeeAddress> employeeAddresses;
  FetchAllAddressOfEmployeeDisplaySuccess(this.employeeAddresses);
}

final class RemoveEmployeeAddressSuccess extends AddressState {
  final EmployeeAddress employeeAddress;
  RemoveEmployeeAddressSuccess(this.employeeAddress);
}
