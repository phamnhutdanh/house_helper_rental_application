import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/common/widgets/gradient_button.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/widgets/show_ban_bottomsheet_dialog.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/comment_rating_item.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/numbers_widget.dart';

class EmployeeDetailPage extends StatefulWidget {
  final String accountId;
  const EmployeeDetailPage({super.key, required this.accountId});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  void initState() {
    context.read<AccountsBloc>().add(GetAccountByIdEvent(id: widget.accountId));
    super.initState();
  }

  void onRefreshPreviousScreen() {
    context.read<AccountsBloc>().add(FetchAllAccountData());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onRefreshPreviousScreen();
      },
      child: Scaffold(
          backgroundColor: AppPalette.whiteColor,
          appBar: DefaultAppBar(
              title: 'View info',
              isVisibleBackButton: true,
              onPressBack: () {
                onRefreshPreviousScreen();
                Beamer.of(context).beamBack();
              }),
          body: BlocConsumer<AccountsBloc, AccountsState>(
            listener: (context, state) {
              if (state is AccountsFailure) {
                showSnackBar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is AccountsLoading) {
                return const Loader();
              }

              if (state is GetAccountByIdSuccess) {
                final currentAccount = state.accountInfo;
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
                                image: NetworkImage(
                                    currentAccount.employee!.imageUri ?? ''),
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
                      email: currentAccount.email ?? '',
                      name: currentAccount.employee!.name ?? '',
                      phoneNumber: currentAccount.employee!.phoneNumber ?? '',
                      age: currentAccount.employee!.age ?? 0,
                    ),
                    const SizedBox(height: 24),
                    NumbersWidget(
                      averageRating:
                          currentAccount.employee!.averageRating ?? 0.0,
                      ratingCount: currentAccount.employee!.ratings != null
                          ? currentAccount.employee!.ratings!.length
                          : 0,
                    ),
                    const SizedBox(height: 48),
                    _buildAddress(
                        employeeAddresses:
                            currentAccount.employee!.employeeAddresses ?? []),
                    const SizedBox(height: 48),
                    _buildDescription(
                        description:
                            currentAccount.employee!.description ?? ''),
                    const SizedBox(height: 48),
                    _buildRatingList(
                        ratings: currentAccount.employee!.ratings ?? []),
                    const SizedBox(height: 48),
                    if (currentAccount.status == AccountStatus.NONE)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GradientButton(
                                colors: const [
                                  AppPalette.errorColor,
                                  AppPalette.errorColor,
                                ],
                                textColor: AppPalette.whiteColor,
                                buttonText: 'Ban this user',
                                onPressed: () {
                                  setState(() {
                                    return showBanBottomSheetDialog(
                                        context, widget.accountId);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (currentAccount.status == AccountStatus.BANNED)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GradientButton(
                                colors: const [
                                  AppPalette.darkGrey,
                                  AppPalette.darkGrey,
                                ],
                                textColor: AppPalette.whiteColor,
                                buttonText: 'Unban this user',
                                onPressed: () {
                                  setState(() {
                                    return showUnBanBottomSheetDialog(
                                        context, widget.accountId);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }
              return const SizedBox();
            },
          )),
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
