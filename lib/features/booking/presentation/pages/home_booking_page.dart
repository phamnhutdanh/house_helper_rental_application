import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/services_list.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/home_appbar.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/home_slider.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/search_fields.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/top_employees_grid.dart';

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

    context.read<BookingBloc>().add(BookingFetchAllHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(
                  username: "Danh",
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
                BlocConsumer<BookingBloc, BookingState>(
                  listener: (context, state) {
                    if (state is BookingFailure) {
                      showSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is BookingLoading) {
                      return const Loader();
                    }
                    if (state is HomeInfoDisplaySuccess) {
                      return ServicesList(services: state.services);
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top employees",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See all"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BlocConsumer<BookingBloc, BookingState>(
                  listener: (context, state) {
                    if (state is BookingFailure) {
                      showSnackBar(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is BookingLoading) {
                      return const Loader();
                    }
                    if (state is HomeInfoDisplaySuccess) {
                      return TopEmployeesGrid(
                        topEmployees: state.topEmployees,
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
