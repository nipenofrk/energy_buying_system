import 'package:energy_trade/backend/services/payment_page.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:energy_trade/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final String energyClass;
  final String supplier;
  final String status;
  final double pricePerUnit;
  final int units;
  final double totalPrice;
  final String address;

  const CheckoutScreen({
    super.key,
    required this.energyClass,
    required this.supplier,
    required this.status,
    required this.pricePerUnit,
    required this.units,
    required this.totalPrice,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: CcColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 21,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //onst SizedBox(height: CcSizes.spaceBtnItems_1),
              // const Divider(color: Colors.black26),
              // const SizedBox(height: CcSizes.spaceBtnItems_1),

              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Expanded(
              //     //   flex: 3,
              //     //   child: Text(
              //     //     "Automatically buy energy production",
              //     //     style: Theme.of(context)
              //     //         .textTheme
              //     //         .headlineSmall!
              //     //         .copyWith(fontSize: 16),
              //     //   ),
              //     // ),
              //     // Expanded(
              //     //   flex: 2,
              //     //   child: SizedBox(
              //     //     width: 100,
              //     //     height: 50,
              //     //     child: DropdownButtonFormField(
              //     //       items: categories.map((category) {
              //     //         return DropdownMenuItem(
              //     //             value: category, child: Text(category));
              //     //       }).toList(),
              //     //       onChanged: (value) {},
              //     //       decoration: InputDecoration(
              //     //           filled: true,
              //     //           fillColor: Colors.transparent,
              //     //           focusedBorder: OutlineInputBorder(
              //     //             borderSide: const BorderSide(color: Colors.grey),
              //     //             borderRadius: BorderRadius.circular(15),
              //     //           ),
              //     //           hintText: "No"),
              //     //     ),
              //     //   ),
              //     // ),
              //     SizedBox(),
              //   ],
              // ),

              //const SizedBox(height: CcSizes.spaceBtnItems_1),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Expanded(
              //     //   flex: 3,
              //     //   child: Text(
              //     //     "At what price should automated buyout should occur",
              //     //     style: Theme.of(context)
              //     //         .textTheme
              //     //         .headlineSmall!
              //     //         .copyWith(fontSize: 16),
              //     //   ),
              //     // ),
              //     Expanded(
              //       flex: 2,
              //       child: SizedBox(
              //         height: 50,
              //         width: 100,
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //             hintText: 'eg. 1000 Tshs',
              //             labelStyle: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .copyWith(fontWeight: FontWeight.w600),
              //             hintStyle: Theme.of(context)
              //                 .textTheme
              //                 .headlineSmall!
              //                 .copyWith(color: Colors.black, fontSize: 13),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // const SizedBox(height: CcSizes.spaceBtnItems_1),
              // const Divider(),
              // const SizedBox(height: CcSizes.spaceBtnItems_1),

              // Display the passed data here
              _buildDetailRow(context, "Energy Type", energyClass),
              _buildDetailRow(context, "Supplier", supplier),
              _buildDetailRow(context, "Status", status),
              _buildDetailRow(context, "Price per Unit", "${pricePerUnit.toStringAsFixed(2)} Tshs"),
              _buildDetailRow(context, "Units", "$units kWh"),
              _buildDetailRow(context, "Total Price", "${totalPrice.toStringAsFixed(2)} Tshs"),
              _buildDetailRow(context, "Address", address),

              const SizedBox(height: CcSizes.spaceBtnItems_1),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       flex: 3,
              //       child: Text(
              //         "Energy Type",
              //         style: Theme.of(context)
              //             .textTheme
              //             .headlineSmall!
              //             .copyWith(fontSize: 16),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: SizedBox(
              //         width: 100,
              //         height: 50,
              //         child: DropdownButtonFormField(
              //           items: eCategories.map((category) {
              //             return DropdownMenuItem(
              //                 value: category, child: Text(category));
              //           }).toList(),
              //           onChanged: (value) {},
              //           decoration: InputDecoration(
              //               filled: true,
              //               fillColor: Colors.transparent,
              //               focusedBorder: OutlineInputBorder(
              //                 borderSide: const BorderSide(color: Colors.grey),
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               hintText: "Solar"),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: CcSizes.spaceBtnItems_1),
              // const Divider(),
              // const SizedBox(height: CcSizes.spaceBtnItems_1),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       flex: 3,
              //       child: Text(
              //         "Automatically buy excess energy when price drops",
              //         style: Theme.of(context)
              //             .textTheme
              //             .headlineSmall!
              //             .copyWith(fontSize: 16),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: SizedBox(
              //         width: 100,
              //         height: 50,
              //         child: DropdownButtonFormField(
              //           items: categories.map((category) {
              //             return DropdownMenuItem(
              //                 value: category, child: Text(category));
              //           }).toList(),
              //           onChanged: (value) {},
              //           decoration: InputDecoration(
              //               filled: true,
              //               fillColor: Colors.transparent,
              //               focusedBorder: OutlineInputBorder(
              //                 borderSide: const BorderSide(color: Colors.grey),
              //                 borderRadius: BorderRadius.circular(15),
              //               ),
              //               hintText: "No"),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       flex: 3,
              //       child: Text(
              //         "At what price do you want to buy excess energy",
              //         style: Theme.of(context)
              //             .textTheme
              //             .headlineSmall!
              //             .copyWith(fontSize: 16),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: SizedBox(
              //         height: 50,
              //         width: 100,
              //         child: TextFormField(
              //           decoration: InputDecoration(
              //             hintText: 'eg. 1000 Tshs',
              //             labelStyle: Theme.of(context)
              //                 .textTheme
              //                 .bodyMedium!
              //                 .copyWith(fontWeight: FontWeight.w600),
              //             hintStyle: Theme.of(context)
              //                 .textTheme
              //                 .headlineSmall!
              //                 .copyWith(color: Colors.black, fontSize: 13),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              const SizedBox(height: CcSizes.spaceBtnItems_1 * 2),
              SizedBox(
                width: CcHelperFunctions.screenWidth() / 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PaymentClass()),
                    );
                  },
                  child: const Text("Buy"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
