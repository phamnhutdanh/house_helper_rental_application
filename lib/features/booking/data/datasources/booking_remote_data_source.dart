import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
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

  Future<List<BookingModel>> getAllBookingOfCustomer({
    required String customerId,
  });

  Future<BookingModel> getBookingById({
    required String id,
  });

  Future<BookingModel> changeBookingStatus({
    required String id,
    required BookingStatus bookingStatus,
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

  @override
  Future<BookingModel> changeBookingStatus({
    required String id,
    required BookingStatus bookingStatus,
  }) async {
    try {
      final changeBookingStatusInput = ChangeBookingStatusInput(
        id: id,
        bookingStatus: bookingStatus,
      );

      final MutationOptions options = MutationOptions(
        document: gql(BookingGraphqlDocuments.changeBookingStatusMutation),
        variables: {
          'changeBookingStatusInput': changeBookingStatusInput.toJson(),
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.mutate(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Mutation change status booking is error!');
      }
      return BookingModel.fromJson(result.data?['changeBookingStatus'] ?? {});
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<BookingModel>> getAllBookingOfCustomer(
      {required String customerId}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(BookingGraphqlDocuments.getAllBookingOfCustomerQuery),
        variables: {
          'customerId': customerId,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError(
            'Query get all booking of customer is error!');
      }

      final resultData =
          result.data?['getAllBookingOfCustomer'] as List<dynamic>;
      return resultData
          .map((service) => BookingModel.fromJson(service))
          .toList();
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<BookingModel> getBookingById({required String id}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(BookingGraphqlDocuments.getBookingById),
        variables: {
          'id': id,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await graphQLClient.query(options);

      if (result.hasException) {
        throw const ServerExceptionError('Query get booking by id is error!');
      }

      final resultData = result.data?['getBookingById'] ?? {};
      return BookingModel.fromJson(resultData);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
