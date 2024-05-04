import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServicesList extends StatelessWidget {
    final List<Service> services;
  const ServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        services[index].image,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  services[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: services.length,
        ));
  }
}