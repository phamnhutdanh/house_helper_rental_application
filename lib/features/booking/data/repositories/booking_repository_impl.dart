import 'package:fpdart/fpdart.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/core/error/failures.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/employee_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/data/datasources/service_remote_data_source.dart';
import 'package:house_helper_rental_application/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final ServicesRemoteDataSource servicesRemoteDataSource;
  final EmployeesRemoteDataSource employeesRemoteDataSource;

  BookingRepositoryImpl(
      this.servicesRemoteDataSource, this.employeesRemoteDataSource);

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


  //   @override
  // Future<Either<Failure, Blog>> uploadBlog({
  //   required File image,
  //   required String title,
  //   required String content,
  //   required String posterId,
  //   required List<String> topics,
  // }) async {
  //   try {
  //     if (!await (connectionChecker.isConnected)) {
  //       return left(Failure(Constants.noConnectionErrorMessage));
  //     }
  //     BlogModel blogModel = BlogModel(
  //       id: const Uuid().v1(),
  //       posterId: posterId,
  //       title: title,
  //       content: content,
  //       imageUrl: '',
  //       topics: topics,
  //       updatedAt: DateTime.now(),
  //     );

  //     final imageUrl = await blogRemoteDataSource.uploadBlogImage(
  //       image: image,
  //       blog: blogModel,
  //     );

  //     blogModel = blogModel.copyWith(
  //       imageUrl: imageUrl,
  //     );

  //     final uploadedBlog = await blogRemoteDataSource.uploadBlog(blogModel);
  //     return right(uploadedBlog);
  //   } on ServerException catch (e) {
  //     return left(Failure(e.message));
  //   }
  // }
}
