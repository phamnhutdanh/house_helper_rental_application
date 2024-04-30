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
      final List<Employee> employees = [
        Employee(
          title: "Wireless Headphones",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z",
          price: 120,
          colors: [
            Colors.black,
            Colors.blue,
            Colors.orange,
          ],
          category: "Headphones",
          rate: 4.8,
        ),
        Employee(
          title: "Woman Sweter",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/sweet.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3N3ZWV0LnBuZyIsImlhdCI6MTcxMzU0NDQwMSwiZXhwIjoxNzQ1MDgwNDAxfQ.08vLOqXSthF8yP5a6WvgEtmQLI2TmMXDIyCohj71DRk&t=2024-04-19T16%3A33%3A21.715Z",
          price: 120,
          colors: [
            Colors.brown,
            Colors.red,
            Colors.pink,
          ],
          category: "Woman Fashion",
          rate: 4.8,
        ),
        Employee(
          title: "Smart Watch",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/watch.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dhdGNoLnBuZyIsImlhdCI6MTcxMzU0NDQxNiwiZXhwIjoxNzQ1MDgwNDE2fQ.Tn_AOVI8wJJ-iGGPAJzjxQHLfNWfh-6qK1959gzPtZ8&t=2024-04-19T16%3A33%3A36.011Z",
          price: 55,
          colors: [
            Colors.black,
          ],
          category: "Watch",
          rate: 4.8,
        ),
      ];

      return employees
          .map(
            (employee) => EmployeeModel(
                colors: employee.colors,
                category: employee.category,
                title: employee.title,
                image: employee.image,
                description: employee.description,
                price: employee.price,
                rate: employee.rate),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<EmployeeModel>> getTopEmployees() async {
    try {
      final List<Employee> employees = [
        Employee(
          title: "Wireless Headphones",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z",
          price: 120,
          colors: [
            Colors.black,
            Colors.blue,
            Colors.orange,
          ],
          category: "Headphones",
          rate: 4.8,
        ),
        Employee(
          title: "Woman Sweter",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/sweet.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3N3ZWV0LnBuZyIsImlhdCI6MTcxMzU0NDQwMSwiZXhwIjoxNzQ1MDgwNDAxfQ.08vLOqXSthF8yP5a6WvgEtmQLI2TmMXDIyCohj71DRk&t=2024-04-19T16%3A33%3A21.715Z",
          price: 120,
          colors: [
            Colors.brown,
            Colors.red,
            Colors.pink,
          ],
          category: "Woman Fashion",
          rate: 4.8,
        ),
        Employee(
          title: "Smart Watch",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
          image:
              "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/watch.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dhdGNoLnBuZyIsImlhdCI6MTcxMzU0NDQxNiwiZXhwIjoxNzQ1MDgwNDE2fQ.Tn_AOVI8wJJ-iGGPAJzjxQHLfNWfh-6qK1959gzPtZ8&t=2024-04-19T16%3A33%3A36.011Z",
          price: 55,
          colors: [
            Colors.black,
          ],
          category: "Watch",
          rate: 4.8,
        ),
      ];

      return employees
          .map(
            (employee) => EmployeeModel(
                colors: employee.colors,
                category: employee.category,
                title: employee.title,
                image: employee.image,
                description: employee.description,
                price: employee.price,
                rate: employee.rate),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
