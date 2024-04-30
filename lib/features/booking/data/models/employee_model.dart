import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.colors,
    required super.category,
    required super.rate,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'colors': colors,
      'category': category,
      'rate': rate,
    };
  }

  factory EmployeeModel.fromJson(Map<String, dynamic> map) {
    return EmployeeModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      colors: List<Color>.from(map['colors'] ?? []),
      category: map['category'] as String,
      rate: map['rate'] as double,
    );
  }

  EmployeeModel copyWith({
    String? title,
    String? image,
    String? description,
    String? category,
    double? price,
    double? rate,
    List<Color>? colors,
  }) {
    return EmployeeModel(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      colors: colors ?? this.colors,
    );
  }
}
