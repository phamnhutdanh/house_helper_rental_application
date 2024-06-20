import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/report_view.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      appBar: DefaultAppBar(
          title: 'Report', isVisibleBackButton: false, onPressBack: () {}),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Total income this by month!",
              style: TextStyle(
                color: AppPalette.blackColor,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: ReportView(),
            ),
            SizedBox(height: 20.0),
            Text(
              "Well done! Keep doing your job to made more value for us!",
              style: TextStyle(
                color: AppPalette.darkGrey,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
