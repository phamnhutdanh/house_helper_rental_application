import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServiceListItemModel extends Service {
  ServiceListItemModel({
    required super.id,
    required super.name,
    required super.imageUri,
    required super.serviceCode,
  });

  factory ServiceListItemModel.fromJson(Map<String, dynamic> map) {
    return ServiceListItemModel(
        id: map['id'] as String,
        name: map['name'] as String,
        imageUri: map['imageUri'] as String,
        serviceCode: map['serviceCode'] as String
        );
  }

  ServiceListItemModel copyWith({
    String? id,
    String? name,
    String? imageUri,
    String? serviceCode,
  }) {
    return ServiceListItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUri: imageUri ?? this.imageUri,
      serviceCode: serviceCode ?? this.serviceCode,
    );
  }
}
