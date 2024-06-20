import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_back_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/favorite_employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/comment_rating_item.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/numbers_widget.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:iconly/iconly.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final String employeeId;
  const EmployeeDetailsPage({
    super.key,
    required this.employeeId,
  });

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  void onRefreshPreviousScreen() {
    context.read<ServiceBloc>().add(FetchAllServicesEvent());
    context.read<EmployeeBloc>().add(FetchTopEmployeesEvent());
  }

  late final customerId =
      (BlocProvider.of<AuthBloc>(context).state as AuthSuccess)
              .accountInfo
              .customer!
              .id ??
          '';

  @override
  void initState() {
    context
        .read<EmployeeBloc>()
        .add(GetEmployeeByIdEvent(id: widget.employeeId));

    context.read<FavoriteEmployeeBloc>().add(CheckFavoriteEvent(
        employeeId: widget.employeeId, customerId: customerId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onRefreshPreviousScreen();
      },
      child: Scaffold(
        backgroundColor: AppPalette.whiteColor,
        appBar: AppBar(
          leading: DefaultBackButton(onPressBack: () {
            onRefreshPreviousScreen();
            Beamer.of(context).beamBack();
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            BlocConsumer<FavoriteEmployeeBloc, FavoriteEmployeeState>(
              listener: (context, state) {
                if (state is FavoriteEmployeeFailure) {
                  showSnackBar(context, state.error);
                }
                if (state is AddToFavoriteSuccess) {
                  context.read<FavoriteEmployeeBloc>().add(CheckFavoriteEvent(
                      employeeId: widget.employeeId, customerId: customerId));
                }
                if (state is RemoveFromFavoriteSuccess) {
                  context.read<FavoriteEmployeeBloc>().add(CheckFavoriteEvent(
                      employeeId: widget.employeeId, customerId: customerId));
                }
              },
              builder: (context, state) {
                if (state is FavoriteEmployeeLoading) {
                  return const Loader();
                }
                if (state is CheckFavoriteSuccess) {
                  if (state.isFavorite == true) {
                    return IconButton(
                      icon: const Icon(
                        IconlyBold.heart,
                        color: AppPalette.errorColor,
                      ),
                      onPressed: () {
                        context.read<FavoriteEmployeeBloc>().add(
                              RemoveFromFavoriteEvent(
                                employeeId: widget.employeeId,
                                customerId: customerId,
                              ),
                            );
                      },
                    );
                  }
                  return IconButton(
                    icon: const Icon(IconlyLight.heart),
                    onPressed: () {
                      context.read<FavoriteEmployeeBloc>().add(
                            AddToFavoriteEvent(
                              employeeId: widget.employeeId,
                              customerId: customerId,
                            ),
                          );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        body: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (context, state) {
            if (state is EmployeeFailure) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return const Loader();
            }
            if (state is GetEmployeeByIdDisplaySuccess) {
              final employee = state.employee;
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: Ink.image(
                              image: NetworkImage(employee.imageUri ?? ''),
                              fit: BoxFit.cover,
                              width: 128,
                              height: 128,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildName(
                    email: employee.accountInfo!.email ?? '',
                    name: employee.name ?? '',
                    phoneNumber: employee.phoneNumber ?? '',
                    age: employee.age ?? 0,
                  ),
                  // const SizedBox(height: 24),
                  // Center(
                  //     child: ButtonWidget(
                  //   text: 'Book this employee',
                  //   onClicked: () {},
                  // )),
                  const SizedBox(height: 24),
                  NumbersWidget(
                    averageRating: employee.averageRating ?? 0.0,
                    ratingCount:
                        employee.ratings != null ? employee.ratings!.length : 0,
                  ),
                  //const SizedBox(height: 48),
                  _buildAddress(
                      employeeAddresses: employee.employeeAddresses ?? []),
                  const SizedBox(height: 48),
                  _buildDescription(description: employee.description ?? ''),
                  const SizedBox(height: 48),
                  _buildRatingList(ratings: employee.ratings ?? []),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Widget _buildRatingList({required List<RatingEmployee> ratings}) {
  if (ratings.isNotEmpty) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All ratings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          if (ratings.isEmpty) const Text('There is no rating here!'),
          if (ratings.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: ratings.length,
              itemBuilder: (context, index) {
                return CommentRatingItem(
                  imageUri: ratings[index].customer!.imageUri ?? '',
                  name: ratings[index].customer!.name ?? '',
                  score: ratings[index].score ?? 0,
                  comment: ratings[index].comment ?? '',
                  commentDate: ratings[index].updatedAt ?? DateTime.now(),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
        ],
      ),
    );
  }
  return const SizedBox();
}

Widget _buildName({
  required String name,
  required String email,
  required String phoneNumber,
  required int age,
}) =>
    Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 4),
        if (age > 0)
          Text(
            "Age: $age",
            style: const TextStyle(color: Colors.grey),
          ),
      ],
    );

Widget _buildDescription({required String description}) {
  if (description != '') {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
  return const SizedBox();
}

Widget _buildAddress({required List<EmployeeAddress> employeeAddresses}) {
  if (employeeAddresses.isNotEmpty) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Address',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: employeeAddresses.length,
            itemBuilder: (context, index) => Text(
              employeeAddresses[index].address!.address ?? '',
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 4),
          ),
        ],
      ),
    );
  }
  return const SizedBox();
}
