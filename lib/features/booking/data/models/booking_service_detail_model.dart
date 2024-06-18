import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/features/services/data/models/service_detail_model.dart';

class BookingServiceDetailModel extends BookingServiceDetail {
  BookingServiceDetailModel({
    super.id,
    super.bookingId,
    super.serviceDetailId,
    super.serviceDetails,
  });

  factory BookingServiceDetailModel.fromJson(Map<String, dynamic> map) {
    return BookingServiceDetailModel(
      id: map['id'] as String?,
      bookingId: map['bookingId'] as String?,
      serviceDetailId: map['serviceDetailId'] as String?,
      serviceDetails: ServiceDetailModel.fromJson(map['serviceDetails'] ?? {}),
    );
  }

  BookingServiceDetailModel copyWith({
    String? id,
    String? bookingId,
    String? serviceDetailId,
    ServiceDetails? serviceDetails,
  }) {
    return BookingServiceDetailModel(
      id: id ?? this.id,
      bookingId: bookingId ?? this.bookingId,
      serviceDetailId: serviceDetailId ?? this.serviceDetailId,
      serviceDetails: serviceDetails ?? this.serviceDetails,
    );
  }
}
