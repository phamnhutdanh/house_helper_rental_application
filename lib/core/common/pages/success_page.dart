import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Center(
              child: Lottie.network(
                "https://assets8.lottiefiles.com/packages/lf20_jz2wa00k.json",
                width: 200,
                height: 200,
                repeat: true,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Successfully completed!",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            GradientButton(
              buttonText: "Back to home",
              onPressed: () {
                context.read<ServiceBloc>().add(FetchAllServicesEvent());
                context.read<EmployeeBloc>().add(FetchTopEmployeesEvent());

                Beamer.of(context).beamToReplacementNamed('/booking_home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
