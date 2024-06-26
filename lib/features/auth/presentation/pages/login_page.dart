import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/routers/admin_app/admin_router.dart';
import 'package:house_helper_rental_application/core/routers/customer_app/booking_router.dart';
import 'package:house_helper_rental_application/core/routers/employee_app/task_router.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/pages/banned_page.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/auth/presentation/pages/signup_page.dart';
import 'package:house_helper_rental_application/core/common/widgets/input_field.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthSuccess) {
              if (state.accountInfo.status == AccountStatus.BANNED) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BannedPage()),
                  (route) => false,
                );
                return;
              }

              if (state.accountInfo.accountRole == AccountInfoRole.CUSTOMER) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => BookingRouter()),
                  (route) => false,
                );
              } else if (state.accountInfo.accountRole ==
                  AccountInfoRole.EMPLOYEE) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TaskRouter()),
                  (route) => false,
                );
              } else if (state.accountInfo.accountRole ==
                  AccountInfoRole.ADMIN) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AdminRouter()),
                  (route) => false,
                );
              }
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  InputField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    buttonText: 'Sign in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignUpPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppPalette.thirdColor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
