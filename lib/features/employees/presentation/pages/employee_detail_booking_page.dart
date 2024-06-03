import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class EmployeeDetailBookingPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const EmployeeDetailBookingPage(),
      );
  const EmployeeDetailBookingPage({super.key});
  @override
  State<EmployeeDetailBookingPage> createState() => _EmployeeDetailBookingPageState();
}

class _EmployeeDetailBookingPageState extends State<EmployeeDetailBookingPage> {
  String imageUri =
      "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: AppPalette.transparentColor,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z"),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            AppPalette.blackColor,
                            AppPalette.blackColor.withOpacity(.3)
                          ])),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Emma Watson",
                              style: TextStyle(
                                  color: AppPalette.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "60 Videos",
                                  style: TextStyle(
                                      color: AppPalette.greyColor,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "240K Subscribers",
                                  style: TextStyle(
                                      color: AppPalette.greyColor,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Emma Charlotte Duerre Watson was born in Paris, France, to English parents, Jacqueline Luesby and Chris Watson, both lawyers. She moved to Oxfordshire when she was five, where she attended the Dragon School.",
                          style: TextStyle(
                              color: AppPalette.greyColor, height: 1.4),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Born",
                          style: TextStyle(
                              color: AppPalette.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "April, 15th 1990, Paris, France",
                          style: TextStyle(color: AppPalette.greyColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Nationality",
                          style: TextStyle(
                              color: AppPalette.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "British",
                          style: TextStyle(color: AppPalette.greyColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Videos",
                          style: TextStyle(
                              color: AppPalette.blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeVideo(image: 'assets/emma-1.jpg'),
                              makeVideo(image: 'assets/emma-2.jpg'),
                              makeVideo(image: 'assets/emma-3.jpg'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppPalette.greyColor),
                          child: const Align(
                            child: Text(
                              "Follow",
                              style: TextStyle(color: AppPalette.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: NetworkImage(
                    "https://ktlpvxvfzxexvghactxx.supabase.co/storage/v1/object/sign/helpu_buckets/wireless.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJoZWxwdV9idWNrZXRzL3dpcmVsZXNzLnBuZyIsImlhdCI6MTcxMzU0NDM4NywiZXhwIjoxNzQ1MDgwMzg3fQ.eou_TXvFgMjOtazTe_m6rf4gkIilO-vZ9yQN2zhJ_5k&t=2024-04-19T16%3A33%3A07.167Z"),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            AppPalette.blackColor.withOpacity(.9),
            AppPalette.blackColor.withOpacity(.3)
          ])),
          child: const Align(
            child: Icon(
              Icons.play_arrow,
              color: AppPalette.whiteColor,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}