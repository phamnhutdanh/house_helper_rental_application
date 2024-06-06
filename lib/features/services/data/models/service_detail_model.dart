import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServiceDetailModel extends ServiceDetails {
  ServiceDetailModel({
    super.id,
    super.name,
    super.imageUri,
    super.fee,
    super.description,
    super.serviceDetailCode,
    super.serviceId,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> map) {
    return ServiceDetailModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      imageUri: map['imageUri'] as String?,
      fee: map['fee'] as int?,
      description: map['description'] as String?,
      serviceDetailCode: map['serviceDetailCode'] as String?,
      serviceId: map['serviceId'] as String?,
    );
  }

  ServiceDetailModel copyWith({
    String? id,
    String? name,
    String? imageUri,
    int? fee,
    String? description,
    String? serviceDetailCode,
    String? serviceId,
  }) {
    return ServiceDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUri: imageUri ?? this.imageUri,
      fee: fee ?? this.fee,
      description: description ?? this.description,
      serviceDetailCode: serviceDetailCode ?? this.serviceDetailCode,
      serviceId: serviceId ?? this.serviceId,
    );
  }
}
