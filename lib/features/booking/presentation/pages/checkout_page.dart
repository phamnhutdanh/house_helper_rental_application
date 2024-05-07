import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_helper_rental_application/core/theme/app_pallete.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              //// Item here
              SizedBox(
                height: 12,
              ),
              Container(
                color: AppPallete.whiteColor,
                decoration: BoxDecoration(
                  color: Colors.white, // Container color
                  border: Border.all(
                    color: AppPallete.borderColor, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                padding: EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 12),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Have a promo code? Enter here",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {},
                            // style: ,
                            child: Text("Apply")))
                  ],
                ),
              ),

              SizedBox(
                height: 12,
              ),

              Container(
                padding: EdgeInsets.all(12),
                //color: AppPallete.whiteColor,
                decoration: BoxDecoration(
                  color: Colors.white, // Container color
                  border: Border.all(
                    color: AppPallete.borderColor, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text("\$256.0",
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping Fee",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text("\$6.0",
                                style: Theme.of(context).textTheme.labelLarge),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tax Fee",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text("\$6.0",
                                style: Theme.of(context).textTheme.labelLarge),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order total",
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text("\$256.0",
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Payment method",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                      color: AppPallete.blackColor,
                                    )),
                            TextButton(onPressed: () {}, child: Text("Change")),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 35,
                              padding: const EdgeInsets.all(4),
                              // child: Image(image: AssetImage(paypal),),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Paypal',
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
