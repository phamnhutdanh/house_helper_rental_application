import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class ServiceDetailsList extends StatelessWidget {
  final List<ServiceDetails> serviceDetails;
  final List<ServiceDetails> selectedServices;
  final void Function(int) onTapItem;

  const ServiceDetailsList({
    super.key,
    required this.serviceDetails,
    required this.selectedServices,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: serviceDetails.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        String serviceDetailId = serviceDetails[index].id ?? '';
        return GestureDetector(
            onTap: () {
              onTapItem(index);
            },
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: selectedServices
                          .map((item) => item.id)
                          .contains(serviceDetailId)
                      ? AppPalette.thirdColor
                      : AppPalette.transparentColor,
                ),
                margin: const EdgeInsets.only(right: 20),
                child: SingleChildScrollView(
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
                            color: selectedServices
                                    .map((item) => item.id)
                                    .contains(serviceDetailId)
                                ? AppPalette.whiteColor
                                : Colors.grey.shade800,
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
                )));
      },
    );
  }
}
