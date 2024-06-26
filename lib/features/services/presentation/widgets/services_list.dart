import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';

class ServicesList extends StatelessWidget {
  final List<Service> services;
  final void Function(String) onTapItem;
  const ServicesList({
    super.key,
    required this.services,
    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                final String serviceId = services[index].id ?? '';
                onTapItem(serviceId);
              },
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          services[index].imageUri ?? '',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    services[index].name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: services.length,
        ));
  }
}
