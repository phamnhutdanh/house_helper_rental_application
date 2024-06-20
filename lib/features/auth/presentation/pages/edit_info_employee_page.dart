// import 'package:flutter/material.dart';
// import 'package:house_helper_rental_application/features/employees/presentation/widgets/button_widget.dart';
// import 'package:house_helper_rental_application/features/auth/presentation/widgets/choose_image_widget.dart';

// class EditInfoPage extends StatefulWidget {
//   const EditInfoPage({super.key});

//   @override
//   State<EditInfoPage> createState() => _EditInfoPageState();
// }

// class _EditInfoPageState extends State<EditInfoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: buildAppBar(context),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ChooseImageWidget(
//             imagePath: user.imagePath,
//             onClicked: () async {},
//           ),
//           const SizedBox(height: 24),
//           buildName(user),
//           const SizedBox(height: 24),
//           Center(child: buildUpgradeButton()),
//           const SizedBox(height: 24),
//           //  NumbersWidget(),
//           const SizedBox(height: 48),
//           buildAbout(user),
//         ],
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(
//             user.name,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           )
//         ],
//       );

//   Widget buildUpgradeButton() => ButtonWidget(
//         text: 'Upgrade To PRO',
//         onClicked: () {},
//       );

//   Widget buildAbout(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
//       );
// }
