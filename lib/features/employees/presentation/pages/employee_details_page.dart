import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/common/widgets/default_back_button.dart';
import 'package:house_helper_rental_application/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/button_widget.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/comment_rating_item.dart';
import 'package:house_helper_rental_application/features/employees/presentation/widgets/numbers_widget.dart';
import 'package:house_helper_rental_application/features/services/presentation/bloc/service_bloc.dart';
import 'package:iconly/iconly.dart';

//  ratings               RatingEmployee[]
class User {
  final String imageUri;
  final String name;
  final String email;
  final String phoneNumber;
  final String description;
  final int age;
  final double averageRating;
  final List<RatingEmployee> ratings;

  const User({
    required this.imageUri,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.description,
    required this.age,
    required this.averageRating,
    required this.ratings,
  });
}

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
  @override
  Widget build(BuildContext context) {
    final user = User(
      imageUri:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
      email: 'asdasd',
      name: 'nameeeee',
      phoneNumber: '011111',
      description:
          'Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem',
      age: 0,
      averageRating: 0,
      ratings: [],
    );
    void onRefreshPreviousScreen() {
      context.read<ServiceBloc>().add(FetchAllServicesEvent());
      context.read<EmployeeBloc>().add(FetchTopEmployeesEvent());
    }

    return Scaffold(
      appBar: AppBar(
        leading: DefaultBackButton(onPressBack: () {
          onRefreshPreviousScreen();
          Beamer.of(context).beamBack();
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            //icon: Icon(IconlyBold.heart),
            icon: Icon(IconlyLight.heart),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Ink.image(
                      image: NetworkImage(user.imageUri),
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
          buildName(
            email: user.email,
            name: user.name,
            phoneNumber: user.phoneNumber,
            age: user.age,
          ),
          const SizedBox(height: 24),
          Center(
              child: ButtonWidget(
            text: 'Book this employee',
            onClicked: () {},
          )),
          const SizedBox(height: 24),
          NumbersWidget(
            averageRating: user.averageRating,
            ratingCount: user.ratings.length,
          ),
          const SizedBox(height: 48),
          buildAbout(description: user.description),
          const SizedBox(height: 48),
          buildRatingList(ratings: user.ratings),
        ],
      ),
    );
  }
}

Widget buildRatingList({required List<RatingEmployee> ratings}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All ratings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (ratings.isEmpty) const Text('There is nothing here!'),
        if (ratings.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: ratings.length,
              itemBuilder: (context, index) {
                return CommentRatingItem(
                  imageUri: ratings[index].customer!.imageUri ?? '',
                  name: ratings[index].customer!.name ?? '',
                  score: ratings[index].score ?? 0.0,
                  comment: ratings[index].comment ?? '',
                  commentDate: ratings[index].updatedAt ?? DateTime.now(),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
      ],
    ),
  );
}

Widget buildName({
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

Widget buildAbout({required String description}) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
