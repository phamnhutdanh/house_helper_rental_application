import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUri,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'imageUri': imageUri,
      //'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUri: map['imageUri'] as String,

      // topics: List<String>.from(map['topics'] ?? []),
      // updatedAt: map['updated_at'] == null
      //     ? DateTime.now()
      //     : DateTime.parse(map['updated_at']),
    );
  }

  ServiceModel copyWith(
      {String? id, String? name, String? description, String? imageUri
      // List<String>? topics,
      // DateTime? updatedAt,
      }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUri: imageUri ?? this.imageUri,
    );
  }
}
