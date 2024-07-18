import 'package:energy_trade/features/shop/01_home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:energy_trade/backend/services/back_end_system/mobile_payment_controller.dart';
import 'package:energy_trade/backend/services/back_end_system/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Adjust the path as needed

class MobilePaymentForm extends StatelessWidget {
  final double totalPrice;

  MobilePaymentForm({required this.totalPrice});

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    // Set the total price in the controller
    paymentController.amount.value = totalPrice.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Make Payment Here',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Obx(
                  () => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select Network',
                      prefixIcon: Icon(Icons.network_cell),
                    ),
                    value: paymentController.selectedNetwork.value.isEmpty
                        ? null
                        : paymentController.selectedNetwork.value,
                    items: const [
                      DropdownMenuItem(
                        value: 'Vodacom',
                        child: Text('Vodacom'),
                      ),
                      DropdownMenuItem(
                        value: 'Airtel',
                        child: Text('Airtel'),
                      ),
                      DropdownMenuItem(
                        value: 'Halotel',
                        child: Text('Halotel'),
                      ),
                      DropdownMenuItem(
                        value: 'Tigo',
                        child: Text('Tigo'),
                      ),
                    ],
                    onChanged: (value) {
                      paymentController.selectedNetwork.value = value!;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  onChanged: (value) {
                    paymentController.phoneNumber.value = value;
                  },
                ),
                const SizedBox(height: 24),
                // Display the total price as a read-only field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixIcon: Icon(Icons.money),
                  ),
                  initialValue: totalPrice.toString(),
                  readOnly: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    processPayment(
                      paymentController.phoneNumber.value,
                      paymentController.amount.value,
                      paymentController.selectedNetwork.value,
                    );
                    Get.snackbar(
                      'Payment',
                      'Processing payment with ${paymentController.selectedNetwork.value}...',
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  ),
                  child: const Text('Pay Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> processPayment(
      String phoneNumber, String amount, String network) async {
    var url = Uri.parse('$baseUrl/api/transactions/');
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'Mobile_network': network,
        'phone_number': phoneNumber,
        'total_cost': amount,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      String message = jsonResponse['message'];
      // Handle successful payment response
      Get.snackbar(
        'Payment',
        'Payment successful: $message',
        snackPosition: SnackPosition.TOP,
      );
      Future.delayed(const Duration(seconds: 2), () {
        Get.to(() => const HomeScreen());
      });
    } else {
      var jsonResponse = jsonDecode(response.body);
      String message = jsonResponse['message'];
      // Handle payment error
      Get.snackbar(
        'Payment',
        'Payment failed with status code ${response.statusCode}: $message',
        snackPosition: SnackPosition.TOP,
      );
      print('Payment failed with status code ${response.statusCode}: $message');
    }
  }
}
