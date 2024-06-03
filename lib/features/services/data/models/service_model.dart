import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/services/data/models/service_detail_model.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.id,
    required super.name,
    required super.serviceDetails,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as String,
      name: map['name'] as String,
      serviceDetails: (map['serviceDetails'] as List<dynamic>)
          .map((serviceDetail) => ServiceDetailModel.fromJson(serviceDetail))
          .toList(),
    );
  }

  ServiceModel copyWith({
    String? id,
    String? name,
    List<ServiceDetails>? serviceDetails,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      serviceDetails: serviceDetails ?? this.serviceDetails,
    );
  }
}
