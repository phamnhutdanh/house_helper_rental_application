import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/features/address/data/models/address_model.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';

class EmployeeAddressModel extends EmployeeAddress {
  EmployeeAddressModel({
    super.id,
    super.addressType,
    super.address,
    super.employee,
  });

  factory EmployeeAddressModel.fromJson(Map<String, dynamic> map) {
    return EmployeeAddressModel(
      id: map['id'] as String?,
      addressType: (map['addressType'] == 'DEFAULT'
          ? AddressType.DEFAULT
          : AddressType.NONE) as AddressType?,
      employee: map['employee'] != null
          ? EmployeeModel.fromJson(map['employee'] ?? {})
          : null,
      address: map['address'] != null
          ? AddressModel.fromJson(map['address'] ?? {})
          : null,
    );
  }
}
