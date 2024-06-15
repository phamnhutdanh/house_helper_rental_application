import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/widgets/page_name.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/choose_address_bottomsheet_dialog.dart';
import 'package:house_helper_rental_application/features/address/presentation/widgets/choose_address_bottomsheet_item.dart';

class AddressWidget extends StatefulWidget {
  final void Function({CustomerAddress? customerAddress}) onPressItem;
  const AddressWidget({
    super.key,
    required this.onPressItem,
  });

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  String addressText = '';
  String phoneText = '';
  String fullNameText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const PageName(textName: "Address"),
              TextButton(
                onPressed: () {
                  return showAddressListBottomSheetDialog(
                    context: context,
                    onPressItem: ({customerAddress}) {
                      widget.onPressItem(customerAddress: customerAddress);
                      setState(() {
                        if (customerAddress != null) {
                          addressText = customerAddress.address!.address ?? '';
                          phoneText = customerAddress.address!.phone ?? '';
                          fullNameText =
                              customerAddress.address!.fullName ?? '';
                        }
                      });
                      Navigator.of(context).pop();
                    },
                  );
                },
                child: const Text("Choose address"),
              ),
            ],
          ),
          ChooseAddressBottomSheetItem(
            address: addressText,
            phone: phoneText,
            fullName: fullNameText,
          ),
        ],
      ),
    );
  }
}
