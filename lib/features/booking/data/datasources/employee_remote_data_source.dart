import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/booking/data/models/employee_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class EmployeesRemoteDataSource {
  Future<List<EmployeeModel>> getAllEmployees();
  Future<List<EmployeeModel>> getTopEmployees();
}

class EmployeesRemoteDataSourceImpl implements EmployeesRemoteDataSource {
  final SupabaseClient supabaseClient;
  EmployeesRemoteDataSourceImpl(this.supabaseClient);

  // @override
  // Future<BlogModel> uploadBlog(BlogModel blog) async {
  //   try {
  //     final blogData =
  //         await supabaseClient.from('blogs').insert(blog.toJson()).select();

  //     return BlogModel.fromJson(blogData.first);
  //   } on PostgrestException catch (e) {
  //     throw ServerException(e.message);
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }
  
  // @override
  // Future<String> uploadBlogImage({
  //   required File image,
  //   required BlogModel blog,
  // }) async {
  //   try {
  //     await supabaseClient.storage.from('blog_images').upload(
  //           blog.id,
  //           image,
  //         );

  //     return supabaseClient.storage.from('blog_images').getPublicUrl(
  //           blog.id,
  //         );
  //   } on StorageException catch (e) {
  //     throw ServerException(e.message);
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  @override
  Future<List<EmployeeModel>> getAllEmployees() async {
    try {
      return [];
      // return employees
      //     .map(
      //       (employee) => EmployeeModel(
      //           colors: employee.colors,
      //           category: employee.category,
      //           title: employee.title,
      //           image: employee.image,
      //           description: employee.description,
      //           price: employee.price,
      //           rate: employee.rate),
      //     )
      //     .toList();
    } on PostgrestException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }

  @override
  Future<List<EmployeeModel>> getTopEmployees() async {
    try {
      return [];
      // return employees
      //     .map(
      //       (employee) => EmployeeModel(
      //           colors: employee.colors,
      //           category: employee.category,
      //           title: employee.title,
      //           image: employee.image,
      //           description: employee.description,
      //           price: employee.price,
      //           rate: employee.rate),
      //     )
      //     .toList();
    } on PostgrestException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
