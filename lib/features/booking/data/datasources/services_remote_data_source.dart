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

      final List<Service> services = [
        Service(
            title: "Shoes",
            image:
                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/shoes.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3Nob2VzLmpwZyIsImlhdCI6MTcxMzU0NDY0NywiZXhwIjoxNzQ1MDgwNjQ3fQ.t77fzma8MDnCJLYCNFlitHCvUDGqbREX0TJqrqZCyzM&t=2024-04-19T16%3A37%3A27.662Z"),
        Service(
            title: "Beauty",
            image:
                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/beauty.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL2JlYXV0eS5wbmciLCJpYXQiOjE3MTM1NDQ2NjgsImV4cCI6MTc0NTA4MDY2OH0.nMe_ClTqp93whqihASyns00_JNsDNm5HjfCLcK71KiM&t=2024-04-19T16%3A37%3A48.613Z"),
        Service(
            title: "PC",
            image:
                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/pc.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3BjLmpwZyIsImlhdCI6MTcxMzU0NDY4MywiZXhwIjoxNzQ1MDgwNjgzfQ.HHwxLwH9_uuA8BvcCOql7Hx7C5XQRpCRpcbkwJaePa8&t=2024-04-19T16%3A38%3A03.715Z"),
        Service(
            title: "Mobile",
            image:
                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/mobile.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL21vYmlsZS5qcGciLCJpYXQiOjE3MTM1NDQ2OTYsImV4cCI6MTc0NTA4MDY5Nn0.mjmTwpp3OSAIns1CtF8c0GeckxycI1V833s7uxW0eZ0&t=2024-04-19T16%3A38%3A16.395Z"),
        Service(
            title: "Watch",
            image:
                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/miband.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL21pYmFuZC5qcGciLCJpYXQiOjE3MTM1NDQ1NzAsImV4cCI6MTc0NTA4MDU3MH0.J6NXXPFqvKz75RRCz0yR0P07-guKV65VhSX6t97Lxmw&t=2024-04-19T16%3A36%3A10.869Z"),
      ];
      return services
          .map(
            (service) =>
                ServiceModel(title: service.title, image: service.image),
          )
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
