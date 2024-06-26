import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/widgets/loader.dart';
import 'package:house_helper_rental_application/core/utils/show_snackbar.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/bloc/accounts_bloc.dart';
import 'package:house_helper_rental_application/features/accounts/presentation/widgets/account_tab.dart';
import 'package:house_helper_rental_application/core/common/pages/generic_tab_page.dart';
import 'package:house_helper_rental_application/core/common/widgets/tab_item.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AccountsBloc>().add(FetchAllAccountData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountsBloc, AccountsState>(
      listener: (context, state) {
        if (state is AccountsFailure) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is AccountsLoading) {
          return const Loader();
        }
        if (state is AccountsDisplaySuccess) {
          final List<AccountInfo> accounts = state.accounts;

          late List<AccountInfo> customers = accounts
              .where(
                  (element) => element.accountRole == AccountInfoRole.CUSTOMER)
              .toList();

          late List<AccountInfo> employees = accounts
              .where(
                  (element) => element.accountRole == AccountInfoRole.EMPLOYEE)
              .toList();
          return GenericTabPage(
            title: 'All accounts',
            isScrollableTab: false,
            tabs: [
              TabItem(title: 'EMPLOYEE', count: employees.length),
              TabItem(title: 'CUSTOMER', count: customers.length),
            ],
            children: [
              AccountTab(
                accounts: employees,
                onTapItem: (accountId) {
                  final employeeId = accountId;
                  Beamer.of(context)
                      .beamToNamed('/admin_home/employee_details/$employeeId');
                },
              ),
              AccountTab(
                accounts: customers,
                onTapItem: (accountId) {
                  final customerId = accountId;
                  Beamer.of(context)
                      .beamToNamed('/admin_home/customer_details/$customerId');
                },
              ),
            ],
          );
        }
        return GenericTabPage(
          title: 'All accounts',
          isScrollableTab: false,
          tabs: const [
            TabItem(title: 'EMPLOYEE', count: 0),
            TabItem(title: 'CUSTOMER', count: 0),
          ],
          children: [
            AccountTab(
              accounts: const [],
              onTapItem: (accountId) {},
            ),
            AccountTab(
              accounts: const [],
              onTapItem: (accountId) {},
            ),
          ],
        );
      },
    );
  }
}
