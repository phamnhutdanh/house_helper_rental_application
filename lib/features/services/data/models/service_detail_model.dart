import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServiceDetailModel extends ServiceDetails {
  ServiceDetailModel({
    required super.id,
    required super.name,
    required super.imageUri,
    required super.fee,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> map) {
    return ServiceDetailModel(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUri: map['imageUri'] as String,
      fee: map['fee'] as int,
    );
  }

  ServiceDetailModel copyWith({
    String? id,
    String? name,
    String? imageUri,
    int? fee,
  }) {
    return ServiceDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUri: imageUri ?? this.imageUri,
      fee: fee ?? this.fee,
    );
  }
}
