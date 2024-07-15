import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final phoneNumber = TextEditingController();
  final postalCode=TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form key
}
