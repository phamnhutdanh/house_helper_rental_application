import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/pick_image.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/widgets/choose_image_widget.dart';

class EditInfoCustomerPage extends StatefulWidget {
  const EditInfoCustomerPage({super.key});

  @override
  State<EditInfoCustomerPage> createState() => _EditInfoCustomerPageState();
}

class _EditInfoCustomerPageState extends State<EditInfoCustomerPage> {
  late final currentUser =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

  late final nameController =
      TextEditingController(text: currentUser.customer!.name ?? '');
  late final phoneController =
      TextEditingController(text: currentUser.customer!.phoneNumber ?? '');
  late String imageUri = currentUser.customer!.imageUri ?? '';
  final formKey = GlobalKey<FormState>();

  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
        imageUri = pickedImage.path;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      appBar: DefaultAppBar(
          title: 'Edit info',
          isVisibleBackButton: true,
          onPressBack: () {
            Navigator.of(context).pop();
          }),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              image != null
                  ? GestureDetector(
                      onTap: selectImage,
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : ChooseImageWidget(
                      imagePath: imageUri,
                      onClicked: () async {
                        selectImage();
                      },
                    ),
              const SizedBox(height: 20),
              const PageName(textName: 'Name'),
              InputField(
                  hintText: 'Enter your name...', controller: nameController),
              const SizedBox(height: 20),
              const PageName(textName: 'Phone'),
              InputField(
                  hintText: 'Enter your phone...', controller: phoneController),
              const SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    showSnackBar(context, state.message);
                  } else if (state is AuthSuccess) {
                    phoneController.clear();
                    nameController.clear();

                    showSnackBar(context, 'Account updated success!');
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Loader();
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: GradientButton(
                            colors: const [
                              AppPalette.greyColor,
                              AppPalette.greyColor,
                            ],
                            buttonText: 'Cancel',
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 5,
                        child: GradientButton(
                            buttonText: 'Add',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final phone = phoneController.text.trim();
                                final name = nameController.text.trim();

                                context.read<AuthBloc>().add(
                                    UpdateInfoCustomerEvent(
                                        customerId:
                                            currentUser.customer!.id ?? '',
                                        image: image,
                                        name: name,
                                        phone: phone));
                              }
                            }),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
