import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/services/data/models/service_detail_model.dart';

class ServiceModel extends Service {
  ServiceModel({
    super.id,
    super.name,
    super.description,
    super.imageUri,
    super.serviceCode,
    super.serviceDetails,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as String?,
      name: map['name'] as String?,
      imageUri: map['imageUri'] as String?,
      serviceCode: map['serviceCode'] as String?,
      description: map['description'] as String?,
      serviceDetails: map['serviceDetails'] != null
          ? (map['serviceDetails'] as List<dynamic>)
              .map(
                  (serviceDetail) => ServiceDetailModel.fromJson(serviceDetail))
              .toList()
          : null,
    );
  }

  ServiceModel copyWith({
    String? id,
    String? name,
    String? imageUri,
    String? serviceCode,
    String? description,
    List<ServiceDetails>? serviceDetails,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUri: imageUri ?? this.imageUri,
      serviceCode: serviceCode ?? this.serviceCode,
      description: description ?? this.description,
      serviceDetails: serviceDetails ?? this.serviceDetails,
    );
  }
}
