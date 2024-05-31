import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/address_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/employee_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/service_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;
  final EmployeesRemoteDataSource employeesRemoteDataSource;
  final BookingRemoteDataSource bookingRemoteDataSource;
  final AddressRemoteDataSource addressRemoteDataSource;

  BookingRepositoryImpl(
    this.servicesRemoteDataSource,
    this.employeesRemoteDataSource,
    this.bookingRemoteDataSource,
    this.addressRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Service>>> getAllServices() async {
    try {
      final services = await servicesRemoteDataSource.getAllServices();
      return right(services);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployees() async {
    try {
      final employees = await employeesRemoteDataSource.getAllEmployees();
      return right(employees);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Employee>>> getTopEmployees() async {
    try {
      final employees = await employeesRemoteDataSource.getTopEmployees();
      return right(employees);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Service>> getServiceById({
    required String id,
  }) async {
    try {
      final service = await servicesRemoteDataSource.getServiceById(id: id);
      return right(service);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Booking>> createBooking({
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
      final booking = await bookingRemoteDataSource.createBooking(
        bookingTime: bookingTime,
        customerAddressId: customerAddressId,
        customerId: customerId,
        note: note,
        paymentMethod: paymentMethod,
        repeatStatus: repeatStatus,
        serviceDetails: serviceDetails,
        serviceId: serviceId,
        totalPrice: totalPrice,
      );
      return right(booking);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CustomerAddress>> createCustomerAddress({
    required String address,
    required String fullName,
    required String phone,
    required String customerId,
    required bool isDefault,
  }) async {
    try {
      final customerAddress =
          await addressRemoteDataSource.createCustomerAddress(
        address: address,
        customerId: customerId,
        fullName: fullName,
        isDefault: isDefault,
        phone: phone,
      );
      return right(customerAddress);
    } on ServerExceptionError catch (e) {
      return left(Failure(e.message));
    }
  }
}
