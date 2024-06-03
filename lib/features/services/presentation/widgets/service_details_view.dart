import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class ServiceDetailsView extends StatelessWidget {
  final List<ServiceDetails> serviceDetails;

  const ServiceDetailsView({
    super.key,
    required this.serviceDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: serviceDetails.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppPalette.transparentColor,
          ),
          margin: const EdgeInsets.only(right: 20),
          child: SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      serviceDetails[index].imageUri ?? '',
                      height: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      serviceDetails[index].name ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${serviceDetails[index].fee ?? 0.0}VND",
                      style: const TextStyle(
                        color: AppPalette.blackColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
