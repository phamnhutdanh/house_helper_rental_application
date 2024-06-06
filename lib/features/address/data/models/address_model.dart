import 'package:house_helper_rental_application/core/common/entities/address.dart';

class AddressModel extends Address {
  AddressModel({
    required super.id,
    required super.address,
    required super.fullName,
    required super.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'] as String,
      address: map['address'] as String,
      fullName: map['fullName'] as String,
      phone: map['phone'] as String,
    );
  }

  AddressModel copyWith({
    String? id,
    String? address,
    String? fullName,
    String? phone,
  }) {
    return AddressModel(
      id: id ?? this.id,
      address: address ?? this.address,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
    );
  }
}
