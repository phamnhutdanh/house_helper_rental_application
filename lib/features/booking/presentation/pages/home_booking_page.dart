import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:house_helper_rental_application/features/services/presentation/widgets/services_list.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/home_appbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/home_slider.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/search_fields.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/top_employees_grid.dart';

class HomeBookingPage extends StatefulWidget {
  const HomeBookingPage({super.key});

  @override
  State<HomeBookingPage> createState() => _HomeBookingPageState();
}

class _HomeBookingPageState extends State<HomeBookingPage> {
  int currentSlide = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(FetchAllServicesEvent());
    context.read<EmployeeBloc>().add(FetchTopEmployeesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(
                  username: "",
                ),
                const SizedBox(height: 20),
                const SearchField(),
                const SizedBox(height: 20),
                HomeSlider(
                  onChange: (value) {
                    setState(() {
                      currentSlide = value;
                    });
                  },
                  currentSlide: currentSlide,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<ServiceBloc, ServiceState>(
                  listener: (context, state) {
                    if (state is ServiceFailure) {
                      showSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is ServiceLoading) {
                      return const Loader();
                    }
                    if (state is ServicesListDisplaySuccess) {
                      return ServicesList(
                        services: state.services,
                        onTapItem: (serviceId) {
                          Beamer.of(context).beamToNamed(
                              '/booking_home/check_out/$serviceId');
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 25),
                const Text(
                  "Top employees",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                BlocConsumer<EmployeeBloc, EmployeeState>(
                  listener: (context, state) {
                    if (state is EmployeeFailure) {
                      showSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is EmployeeLoading) {
                      return const Loader();
                    }
                    if (state is TopEmployeesDisplaySuccess) {
                      return TopEmployeesGrid(
                        topEmployees: state.topEmployees,
                        onTapItem: (employeeId) {
                          Beamer.of(context).beamToNamed(
                              '/booking_home/employee_details/$employeeId');
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
