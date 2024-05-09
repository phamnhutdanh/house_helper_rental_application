import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/error/exceptions.dart';
import 'package:house_helper_rental_application/features/booking/data/models/service_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ServicesRemoteDataSource {
  Future<List<ServiceModel>> getAllServices();
}

class ServicesRemoteDataSourceImpl implements ServicesRemoteDataSource {
  final SupabaseClient supabaseClient;
  ServicesRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<ServiceModel>> getAllServices() async {
    try {
      // final blogs =
      //     await supabaseClient.from('blogs').select('*, profiles (name)');
      // return blogs
      //     .map(
      //       (blog) => BlogModel.fromJson(blog).copyWith(
      //         posterName: blog['profiles']['name'],
      //       ),
      //     )
      //     .toList();

      // return services
      //     .map(
      //       (service) =>
      //           ServiceModel(title: service.title, image: service.image),
      //     )
      //     .toList();

      return [];
    } on PostgrestException catch (e) {
      throw ServerExceptionError(e.message);
    } catch (e) {
      throw ServerExceptionError(e.toString());
    }
  }
}
