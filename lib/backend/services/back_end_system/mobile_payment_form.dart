import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:energy_trade/backend/services/back_end_system/mobile_payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
          'Make Payment Here ',
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
                
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Implement payment processing logic here
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
}

//payment simulation

Future<void> processPayment(
    String phoneNumber, String amount, String network) async {
  var url = Uri.parse('https://your-payment-api.com/pay');
  var response = await http.post(
    url,
    body: {
      'phone_number': phoneNumber,
      'amount': amount,
      'network': network,
    },
  );

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    // Handle successful payment response
    print('Payment successful: $jsonResponse');
  } else {
    // Handle payment error
    print('Payment failed: ${response.body}');
  }
}

//onpressed functionality

