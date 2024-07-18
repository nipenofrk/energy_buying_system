import 'dart:async';
import 'dart:convert';
import 'package:energy_trade/backend/services/back_end_system/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uni_links2/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

class PayPalPaymentForm extends StatefulWidget {
  final double totalPrice;

  const PayPalPaymentForm({required this.totalPrice, Key? key}) : super(key: key);

  @override
  _PayPalPaymentFormState createState() => _PayPalPaymentFormState();
}

class _PayPalPaymentFormState extends State<PayPalPaymentForm> {
  late StreamSubscription _sub;

  @override
  void initState() {
    super.initState();
    _initUniLinks();
  }

  Future<void> _initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        final uri = Uri.parse(link);
        if (uri.queryParameters['paymentId'] != null &&
            uri.queryParameters['PayerID'] != null) {
          final paymentId = uri.queryParameters['paymentId'];
          final payerId = uri.queryParameters['PayerID'];
          _executePayment(paymentId!, payerId!);
        }
      }
    }, onError: (err) {
      // Handle error
    });
  }

  Future<void> _executePayment(String paymentId, String payerId) async {
    dynamic response = await http.get(
      Uri.parse(
          '$baseUrl/payment/execute?paymentId=$paymentId&PayerID=$payerId'),
    );
    final responseData = json.decode(response.body);

    if (responseData['status'] == 'Payment successful') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful')),
      );
      Navigator.pop(context); // Navigate back after successful payment
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${responseData['error']}')),
      );
    }
  }

  Future<void> createPayment(BuildContext context) async {
    dynamic response = await http.post(
      Uri.parse('$baseUrl/payment/create'),
      body: json.encode({'amount': widget.totalPrice}), // Pass the amount to the backend
      headers: {'Content-Type': 'application/json'},
    );
    var responseData = json.decode(response.body);
    if (responseData['approval_url'] != null) {
      dynamic url = responseData['approval_url'];
      var url1 = Uri.parse(url);
      if (await canLaunchUrl(url1)) {
        await launchUrl(url1);
      } else {
        throw 'Could not launch $url1';
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${responseData['error']}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: Image.asset(
                  'assets/images/payment/Paypal_2014_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixIcon: Icon(Icons.money),
                ),
                initialValue: widget.totalPrice.toString(),
                readOnly: true,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => createPayment(context),
                  child: const Text(
                    'Pay with PayPal',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
