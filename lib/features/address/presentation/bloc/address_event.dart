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
