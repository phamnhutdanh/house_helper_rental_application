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
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
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
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
