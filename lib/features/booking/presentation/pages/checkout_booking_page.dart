import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_app_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CheckoutBookingPage extends StatefulWidget {
  const CheckoutBookingPage({super.key});

  @override
  State<CheckoutBookingPage> createState() => _CheckoutBookingPageState();
}

class _CheckoutBookingPageState extends State<CheckoutBookingPage> {
  int _selectedDay = 2;
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  List<int> _selectedExteraCleaning = [];

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _days = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _hours = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _repeat = [
    'No repeat',
    'Every day',
    'Every week',
    'Every month'
  ];

  final List<dynamic> _extraCleaning = [
    ['Washing', 'https://img.icons8.com/office/2x/washing-machine.png', '10'],
    ['Fridge', 'https://img.icons8.com/cotton/2x/fridge.png', '8'],
    [
      'Oven',
      'https://img.icons8.com/external-becris-lineal-color-becris/2x/external-oven-kitchen-cooking-becris-lineal-color-becris.png',
      '8'
    ],
    [
      'Vehicle',
      'https://img.icons8.com/external-vitaliy-gorbachev-blue-vitaly-gorbachev/2x/external-bycicle-carnival-vitaliy-gorbachev-blue-vitaly-gorbachev.png',
      '20'
    ],
    [
      'Windows',
      'https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/2x/external-window-interiors-kiranshastry-lineal-color-kiranshastry-1.png',
      '20'
    ],
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: const Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          title: 'Checkout',
          isVisibleBackButton: true,
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Select Date and Time',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text("October 2021"),
                    const Spacer(),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey.shade700,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _days.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDay = _days[index][0];
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _selectedDay == _days[index][0]
                                  ? Colors.blue.shade100.withOpacity(0.5)
                                  : Colors.blue.withOpacity(0),
                              border: Border.all(
                                color: _selectedDay == _days[index][0]
                                    ? Colors.blue
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _days[index][0].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _days[index][1],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(width: 1.5, color: Colors.grey.shade200),
                  ),
                  child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _hours.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedHour = _hours[index];
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _selectedHour == _hours[index]
                                  ? Colors.orange.shade100.withOpacity(0.5)
                                  : Colors.orange.withOpacity(0),
                              border: Border.all(
                                color: _selectedHour == _hours[index]
                                    ? Colors.orange
                                    : Colors.white.withOpacity(0),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _hours[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Repeat",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _repeat.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedRepeat = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: _selectedRepeat == index
                                  ? Colors.blue.shade400
                                  : Colors.grey.shade100,
                            ),
                            margin: const EdgeInsets.only(right: 20),
                            child: Center(
                                child: Text(
                              _repeat[index],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: _selectedRepeat == index
                                      ? Colors.white
                                      : Colors.grey.shade800),
                            )),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Additional Service",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _extraCleaning.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_selectedExteraCleaning.contains(index)) {
                                  _selectedExteraCleaning.remove(index);
                                } else {
                                  _selectedExteraCleaning.add(index);
                                }
                              });
                            },
                            child: Container(
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _selectedExteraCleaning.contains(index)
                                      ? Colors.blue.shade400
                                      : Colors.transparent,
                                ),
                                margin: const EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      _extraCleaning[index][1],
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _extraCleaning[index][0],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: _selectedExteraCleaning
                                                  .contains(index)
                                              ? Colors.white
                                              : Colors.grey.shade800),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "+${_extraCleaning[index][2]}\$",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    )
                                  ],
                                )));
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:house_helper_rental_application/core/theme/app_pallete.dart';

// class CheckoutPage extends StatelessWidget {
//   const CheckoutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(12),
//           child: Column(
//             children: [
//               //// Item here
//               SizedBox(
//                 height: 12,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppPallete.whiteColor, // Container color
//                   border: Border.all(
//                     color: AppPallete.borderColor, // Border color
//                     width: 2.0, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(8.0), // Border radius
//                 ),
//                 padding: EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 12),
//                 child: Row(
//                   children: [
//                     Flexible(
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                             hintText: "Have a promo code? Enter here",
//                             border: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                             enabledBorder: InputBorder.none,
//                             errorBorder: InputBorder.none,
//                             disabledBorder: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                         width: 80,
//                         child: ElevatedButton(
//                             onPressed: () {},
//                             // style: ,
//                             child: Text("Apply")))
//                   ],
//                 ),
//               ),

//               SizedBox(
//                 height: 12,
//               ),

//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppPallete.whiteColor, // Container color
//                   border: Border.all(
//                     color: AppPallete.borderColor, // Border color
//                     width: 2.0, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(8.0), // Border radius
//                 ),
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Subtotal",
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                             Text("\$256.0",
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Shipping Fee",
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                             Text("\$6.0",
//                                 style: Theme.of(context).textTheme.labelLarge),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Tax Fee",
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                             Text("\$6.0",
//                                 style: Theme.of(context).textTheme.labelLarge),
//                           ],
//                         ),
//                         SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Order total",
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                             Text("\$256.0",
//                                 style: Theme.of(context).textTheme.titleMedium),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Divider(),
//                     SizedBox(height: 8),
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Payment method",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headlineSmall!
//                                     .apply(
//                                       color: AppPallete.blackColor,
//                                     )),
//                             TextButton(onPressed: () {}, child: Text("Change")),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Container(
//                               width: 60,
//                               height: 35,
//                               padding: const EdgeInsets.all(4),
//                               // child: Image(image: AssetImage(paypal),),
//                             ),
//                             SizedBox(width: 4),
//                             Text(
//                               'Paypal',
//                               style: Theme.of(context).textTheme.bodyLarge,
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
