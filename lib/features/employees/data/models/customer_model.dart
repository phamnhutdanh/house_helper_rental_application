import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/features/address/data/models/customer_address_model.dart';

class CustomerModel extends Customer {
  CustomerModel({
    super.id,
    super.name,
    super.phoneNumber,
    super.imageUri,
    super.accountInfoId,
    super.customerAddresses,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    return CustomerModel(
        id: map['id'] as String?,
        name: map['name'] as String?,
        phoneNumber: map['phoneNumber'] as String?,
        imageUri: map['imageUri'] as String?,
        accountInfoId: map['accountInfoId'] as String?,
        customerAddresses: map['customerAddresses'] != null
            ? (map['customerAddresses'] as List<dynamic>)
                .map((customerAddress) =>
                    CustomerAddressModel.fromJson(customerAddress))
                .toList()
            : null);
  }

  CustomerModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? imageUri,
    String? accountInfoId,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUri: imageUri ?? this.imageUri,
      accountInfoId: accountInfoId ?? this.accountInfoId,
    );
  }
}
