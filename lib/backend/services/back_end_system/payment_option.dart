import 'package:energy_trade/backend/services/back_end_system/mobile_payment_form.dart';
import 'package:energy_trade/backend/services/payment_page.dart';
import 'package:flutter/material.dart';
//

class PaymentMethodSelectionScreen extends StatelessWidget {
  final double totalPrice;

  const PaymentMethodSelectionScreen({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
           'Choose your payment method',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobilePaymentForm(totalPrice: totalPrice),
                  ),
                );
              },
              child: const Text('Pay with Mobile Money'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>PayPalPaymentForm(totalPrice: totalPrice),
                  ),
                );
              },
              child: const Text('Pay with PayPal'),
            ),
          ],
        ),
      ),
    );
  }
}
