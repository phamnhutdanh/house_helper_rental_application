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

class EditInfoEmployeePage extends StatefulWidget {
  const EditInfoEmployeePage({super.key});

  @override
  State<EditInfoEmployeePage> createState() => _EditInfoEmployeePageState();
}

class _EditInfoEmployeePageState extends State<EditInfoEmployeePage> {
  late final currentUser =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess).accountInfo;

  late final nameController =
      TextEditingController(text: currentUser.employee!.name ?? '');
  late final phoneController =
      TextEditingController(text: currentUser.employee!.phoneNumber ?? '');

  late final descriptionController =
      TextEditingController(text: currentUser.employee!.description ?? '');

  late String imageUri = currentUser.employee!.imageUri ?? '';
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
    descriptionController.dispose();
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
              const PageName(textName: 'Description'),
              InputField(
                  hintText: 'Description...',
                  controller: descriptionController),
              const SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    showSnackBar(context, state.message);
                  } else if (state is AuthSuccess) {
                    phoneController.clear();
                    nameController.clear();
                    descriptionController.clear();

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
                                final description =
                                    descriptionController.text.trim();

                                context
                                    .read<AuthBloc>()
                                    .add(UpdateInfoEmployeeEvent(
                                      employeeId:
                                          currentUser.employee!.id ?? '',
                                      image: image,
                                      name: name,
                                      phone: phone,
                                      description: description,
                                    ));
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
