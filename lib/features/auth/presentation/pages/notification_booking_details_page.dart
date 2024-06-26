import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/constants/constants.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';

class NotificationBookingDetailsPage extends StatefulWidget {
  const NotificationBookingDetailsPage({super.key});

  @override
  State<NotificationBookingDetailsPage> createState() =>
      _NotificationBookingDetailsPageState();
}

class _NotificationBookingDetailsPageState
    extends State<NotificationBookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.kWhiteColor,
      appBar: DefaultAppBar(
        title: 'Checkout',
        isVisibleBackButton: false,
        onPressBack: () {},
      ),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(Constants.kFixPadding),
          padding: const EdgeInsets.all(Constants.kFixPadding),
          decoration: BoxDecoration(
              color: AppPalette.kWhiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(color: AppPalette.kLightColor, blurRadius: 2.0)
              ]),
          child: Column(
            children: [
              const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: Constants.kDarkTextStyle),
              const SizedBox(height: 16.0),
              // Container(
              //     height: 50.0,
              //     width: 50.0,
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //             image: NetworkImage(
              //                 "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z"),
              //             fit: BoxFit.cover,
              //             ))),
              // const SizedBox(height: 16.0),
              const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: TextStyle(color: AppPalette.kLightColor)),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021 04:42 PM',
                    style: TextStyle(color: AppPalette.kLightColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
