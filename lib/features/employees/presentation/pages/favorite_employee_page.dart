import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/empty_widget.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/favorite_employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/favorite_employee_item.dart';

class FavoriteEmployeePage extends StatefulWidget {
  const FavoriteEmployeePage({super.key});

  @override
  State<FavoriteEmployeePage> createState() => _FavoriteEmployeePageState();
}

class _FavoriteEmployeePageState extends State<FavoriteEmployeePage> {
  late final customerId =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
              .accountInfo
              .customer!
              .id ??
          '';

  @override
  void initState() {
    context
        .read<FavoriteEmployeeBloc>()
        .add(GetFavoriteEmployeesOfCustomerEvent(customerId: customerId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Favorite employees',
          isVisibleBackButton: true,
          onPressBack: () {
            Beamer.of(context).beamBack();
          }),
      body: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: BlocConsumer<FavoriteEmployeeBloc, FavoriteEmployeeState>(
            listener: (context, state) {
              if (state is FavoriteEmployeeFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is FavoriteEmployeeLoading) {
                return const Loader();
              }
              if (state is GetFavoriteEmployeesOfCustomerDisplaySuccess) {
                final lists = state.employees;
                if (lists.isEmpty) {
                  return const EmptyWidget(title: 'There is nothing here');
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: lists.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          final employeeId = lists[index].employeeId;
                          Beamer.of(context).beamToNamed(
                              '/booking_settings/favorite_employee/$employeeId');
                        },
                        child: FavoriteEmployeeItem(
                          email:
                              lists[index].employee!.accountInfo!.email ?? '',
                          imageUri: lists[index].employee!.imageUri ?? '',
                          name: lists[index].employee!.name ?? '',
                        ),
                      );
                    },
                  ),
                );
              }

              return const SizedBox();
            },
          )),
    );
  }
}
