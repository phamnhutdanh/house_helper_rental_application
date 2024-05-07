import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/features/booking/presentation/widgets/order_item.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => OrderItem(),
        separatorBuilder: (_, __) => const SizedBox(
              height: 12,
            ),
        itemCount: 10);
  }
}
