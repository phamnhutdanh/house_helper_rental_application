import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/booking_graphql_documents.dart';
import 'package:house_helper_rental_application/features/booking/data/models/booking_model.dart';

abstract interface class BookingRemoteDataSource {
  Future<BookingModel> createBooking({
    required String bookingTime,
    required String repeatStatus,
    required int totalPrice,
    required String note,
    required String paymentMethod,
    required String serviceId,
    required String customerId,
    required String customerAddressId,
    required List<ServiceDetails> serviceDetails,
  });
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final GraphQLClient graphQLClient;
  BookingRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<BookingModel> createBooking({
    required String bookingTime,
    required String repeatStatus,
    required int totalPrice,
    required String note,
    required String paymentMethod,
    required String serviceId,
    required String customerId,
    required String customerAddressId,
    required List<ServiceDetails> serviceDetails,
  }) async {
    try {
      final createBookingInput = CreateBookingInput(
        bookingTime: bookingTime,
        repeatStatus: repeatStatus,
        totalPrice: totalPrice,
        note: note,
        paymentMethod: paymentMethod,
        serviceId: serviceId,
        accountId: customerId,
        customerAddressId: customerAddressId,
      );

      final MutationOptions options = MutationOptions(
        document: gql(BookingGraphqlDocuments.createBookingMutation),
        variables: {
          'createBookingInput': createBookingInput.toJson(),
          'createBookingServiceDetailListInput': serviceDetails.map((item) {
            return {
              'serviceDetailId': item.id,
            };
          }).toList(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError('Mutation create booking is error!');
      }
      return BookingModel.fromJson(result.data?['createBooking'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
