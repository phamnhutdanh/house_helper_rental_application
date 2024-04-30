import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.title,
    required super.image,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      //'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory ServiceModel.fromJson(Map<String, dynamic> map) {
    return ServiceModel(
        title: map['title'] as String, image: map['image'] as String
        // id: map['id'] as String,
        // posterId: map['poster_id'] as String,
        // title: map['title'] as String,
        // content: map['content'] as String,
        // imageUrl: map['image_url'] as String,
        // topics: List<String>.from(map['topics'] ?? []),
        // updatedAt: map['updated_at'] == null
        //     ? DateTime.now()
        //     : DateTime.parse(map['updated_at']),
        );
  }

  ServiceModel copyWith({String? title, String? image
      // String? id,
      // String? posterId,
      // String? title,
      // String? content,
      // String? imageUrl,
      // List<String>? topics,
      // DateTime? updatedAt,
      // String? posterName,
      }) {
    return ServiceModel(
      title: title ?? this.title,
      image: image ?? this.image,
      // id: id ?? this.id,
      // posterId: posterId ?? this.posterId,
      // title: title ?? this.title,
      // content: content ?? this.content,
      // imageUrl: imageUrl ?? this.imageUrl,
      // topics: topics ?? this.topics,
      // updatedAt: updatedAt ?? this.updatedAt,
      // posterName: posterName ?? this.posterName,
    );
  }
}
