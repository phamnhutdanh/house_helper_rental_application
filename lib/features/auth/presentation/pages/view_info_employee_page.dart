// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:house_helper_rental_application/core/common/entities/address.dart';
// import 'package:house_helper_rental_application/core/common/entities/rating.dart';
// import 'package:house_helper_rental_application/core/common/widgets/default_back_button.dart';
// import 'package:house_helper_rental_application/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:house_helper_rental_application/features/employees/presentation/widgets/button_widget.dart';
// import 'package:house_helper_rental_application/features/employees/presentation/widgets/comment_rating_item.dart';
// import 'package:house_helper_rental_application/features/employees/presentation/widgets/numbers_widget.dart';
// import 'package:iconly/iconly.dart';

// class ViewInfoEmployeePage extends StatefulWidget {
//   const ViewInfoEmployeePage({super.key});

//   @override
//   State<ViewInfoEmployeePage> createState() => _ViewInfoEmployeePageState();
// }

// class _ViewInfoEmployeePageState extends State<ViewInfoEmployeePage> {
//   void onRefreshPreviousScreen() {}

//   @override
//   Widget build(BuildContext context) {
//     final currentAccount =
//         (BlocProvider.of(context).state as AuthSuccess).accountInfo;

//     return Scaffold(
//       appBar: AppBar(
//         leading: DefaultBackButton(onPressBack: () {
//           onRefreshPreviousScreen();
//           Beamer.of(context).beamBack();
//         }),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           IconButton(
//             //icon: Icon(IconlyBold.heart),
//             icon: Icon(IconlyLight.heart),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView(
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 ClipOval(
//                   child: Material(
//                     color: Colors.transparent,
//                     child: Ink.image(
//                       image: NetworkImage(user.imageUri),
//                       fit: BoxFit.cover,
//                       width: 128,
//                       height: 128,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           buildName(
//             email: user.email,
//             name: user.name,
//             phoneNumber: user.phoneNumber,
//             age: user.age,
//           ),
//           const SizedBox(height: 24),
//           Center(
//               child: ButtonWidget(
//             text: 'Book this employee',
//             onClicked: () {},
//           )),
//           const SizedBox(height: 24),
//           NumbersWidget(
//             averageRating: user.averageRating,
//             ratingCount: user.ratings.length,
//           ),
//           //const SizedBox(height: 48),
//           // buildAddress(employeeAddresses: employeeAddresses),
//           const SizedBox(height: 48),
//           buildAbout(description: user.description),
//           const SizedBox(height: 48),
//           buildRatingList(ratings: user.ratings),
//         ],
//       ),
//     );
//   }
// }

// Widget buildRatingList({required List<RatingEmployee> ratings}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 48),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'All ratings',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 16),
//         if (ratings.isEmpty) const Text('There is nothing here!'),
//         if (ratings.isNotEmpty)
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: ListView.separated(
//               shrinkWrap: true,
//               physics: const ClampingScrollPhysics(),
//               itemCount: ratings.length,
//               itemBuilder: (context, index) {
//                 return CommentRatingItem(
//                   imageUri: ratings[index].customer!.imageUri ?? '',
//                   name: ratings[index].customer!.name ?? '',
//                   score: ratings[index].score ?? 0,
//                   comment: ratings[index].comment ?? '',
//                   commentDate: ratings[index].updatedAt ?? DateTime.now(),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(),
//             ),
//           ),
//       ],
//     ),
//   );
// }

// Widget buildName({
//   required String name,
//   required String email,
//   required String phoneNumber,
//   required int age,
// }) =>
//     Column(
//       children: [
//         Text(
//           name,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           email,
//           style: const TextStyle(color: Colors.grey),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           phoneNumber,
//           style: const TextStyle(color: Colors.grey),
//         ),
//         const SizedBox(height: 4),
//         if (age > 0)
//           Text(
//             "Age: $age",
//             style: const TextStyle(color: Colors.grey),
//           ),
//       ],
//     );

// Widget buildAbout({required String description}) => Container(
//       padding: const EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Description',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             description,
//             style: const TextStyle(fontSize: 16, height: 1.4),
//           ),
//         ],
//       ),
//     );

// Widget buildAddressEmployee(
//         {required List<EmployeeAddress> employeeAddresses}) =>
//     Container(
//       padding: const EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Address',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const ClampingScrollPhysics(),
//             itemCount: employeeAddresses.length,
//             itemBuilder: (context, index) => Text(
//               employeeAddresses[index].address!.address ?? '',
//               style: const TextStyle(fontSize: 16, height: 1.4),
//             ),
//             separatorBuilder: (_, __) => const SizedBox(height: 4),
//           ),
//         ],
//       ),
//     );

// Widget buildAddressCustomer(
//         {required List<CustomerAddress> customerAddresses}) =>
//     Container(
//       padding: const EdgeInsets.symmetric(horizontal: 48),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Address',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const ClampingScrollPhysics(),
//             itemCount: customerAddresses.length,
//             itemBuilder: (context, index) => Text(
//               customerAddresses[index].address!.address ?? '',
//               style: const TextStyle(fontSize: 16, height: 1.4),
//             ),
//             separatorBuilder: (_, __) => const SizedBox(height: 4),
//           ),
//         ],
//       ),
//     );
