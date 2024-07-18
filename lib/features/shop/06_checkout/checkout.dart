import 'package:energy_trade/backend/services/back_end_system/payment_option.dart';
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
              _buildDetailRow(context, "Energy Type", energyClass),
              _buildDetailRow(context, "Supplier", supplier),
              _buildDetailRow(context, "Status", status),
              _buildDetailRow(context, "Price per Unit", "${pricePerUnit.toStringAsFixed(2)} Tshs"),
              _buildDetailRow(context, "Units", "$units kWh"),
              _buildDetailRow(context, "Total Price", "${totalPrice.toStringAsFixed(2)} Tshs"),
              _buildDetailRow(context, "Address", address),
              const SizedBox(height: CcSizes.spaceBtnItems_1 * 2),
              SizedBox(
                width: CcHelperFunctions.screenWidth() / 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodSelectionScreen(totalPrice: totalPrice),
                      ),
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
