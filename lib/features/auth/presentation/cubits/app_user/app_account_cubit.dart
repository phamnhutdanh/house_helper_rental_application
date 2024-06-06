import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';

part 'app_account_state.dart';

class AppAccountCubit extends Cubit<AppAccountState> {
  AppAccountCubit() : super(AppAccountInitial());

  void updateAccount(AccountInfo? accountInfo) {
    if (accountInfo == null) {
      emit(AppAccountInitial());
    } else {
      emit(AppAccountLoggedIn(accountInfo));
    }
  }
}


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