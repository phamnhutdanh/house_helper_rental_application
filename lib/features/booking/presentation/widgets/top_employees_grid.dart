import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/employee_card.dart';

class TopEmployeesGrid extends StatelessWidget {
  final List<Employee> topEmployees;
  const TopEmployeesGrid({super.key, required this.topEmployees});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: new GridView.count(
    //     crossAxisCount: 2,
    //     childAspectRatio: (4 / 3),
    //     controller: new ScrollController(keepScrollOffset: false),
    //     shrinkWrap: true,
    //     scrollDirection: Axis.vertical,
    //     children: topEmployees.map((Employee employee) {
    //       return new Container(
    //         color: Colors.green,
    //         margin: new EdgeInsets.all(1.0),
    //         child: new Expanded(
    //             child: EmployeeCard(
    //           employee: employee,
    //         )),
    //       );
    //     }).toList(),
    //   ),
    // );

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // crossAxisSpacing: 8,
        // mainAxisSpacing: 8,
      ),
      itemCount: topEmployees.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.all(8),
            child: EmployeeCard(employee: topEmployees[index]));
      },
    );
  }
}



// BlocConsumer<BookingBloc, BookingState>(
//         listener: (context, state) {
//           if (state is BookingFailure) {
//             showSnackBar(context, state.error);
//           }
//         },
//         builder: (context, state) {
//           if (state is BookingLoading) {
//             return const Loader();
//           }
//           if (state is TopEmployeesDisplaySuccess) {
//             return const Text("SUCCESS");
          
//           }
//           return const SizedBox();
//         }, )