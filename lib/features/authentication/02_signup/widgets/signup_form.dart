import 'package:energy_trade/backend/services/back_end_system/aurh.dart';
import 'package:energy_trade/features/authentication/01_login/login.dart';
import 'package:energy_trade/features/authentication/02_signup/controller/signup_controller.dart';
import 'package:energy_trade/features/authentication/02_signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:energy_trade/utils/constants/text_strings.dart';
import 'package:energy_trade/utils/helpers/helper_functions.dart';
import 'package:energy_trade/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signupController.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CcSizes.spaceBtnItems_1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // first name
                Expanded(
                  child: TextFormField(
                    controller: signupController.firstName,
                    validator: (value) => CcValidator.validateEmptyText("First Name", value),
                    decoration: const InputDecoration(
                      labelText: CcTexts.firstName,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(width: CcSizes.spaceBtnInputFields),
                // last name
                Expanded(
                  child: TextFormField(
                    controller: signupController.lastName,
                    validator: (value) => CcValidator.validateEmptyText("Last Name", value),
                    decoration: const InputDecoration(
                      labelText: CcTexts.lastName,
                      prefixIcon: Icon(Icons.person_2_rounded),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // username
            TextFormField(
              controller: signupController.userName,
              validator: (value) => CcValidator.validateEmptyText("Username", value),
              decoration: const InputDecoration(
                labelText: CcTexts.username,
                prefixIcon: Icon(Icons.person_add_alt_rounded),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // email
            TextFormField(
              controller: signupController.email,
              validator: (value) => CcValidator.validateEmail(value),
              decoration: const InputDecoration(
                labelText: CcTexts.email,
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // phone number
            TextFormField(
              controller: signupController.phoneNumber,
              validator: (value) => CcValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: CcTexts.phoneNo,
                prefixIcon: Icon(Icons.phone_android_rounded),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // postal code
            TextFormField(
              controller: signupController.postalCode,
              validator: (value) => CcValidator.validateEmptyText("Postal Code", value),
              decoration: const InputDecoration(
                labelText: "Postal Code",
                prefixIcon: Icon(Icons.location_on_rounded),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // password
            Obx(
              () => TextFormField(
                controller: signupController.password,
                validator: (value) => CcValidator.validatePassword(value),
                obscureText: signupController.hidePassword.value,
                decoration: InputDecoration(
                  labelText: CcTexts.password,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      signupController.hidePassword.value = !signupController.hidePassword.value;
                    },
                    icon: Icon(
                      signupController.hidePassword.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            const TermsAndConditionsCheckBox(),
            const SizedBox(height: CcSizes.spaceBtnInputFields),
            // sign up button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: CcHelperFunctions.screenWidth() / 1.5,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (signupController.signupFormKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Dialog(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularProgressIndicator(),
                                    Text("Registering..."),
                                  ],
                                ),
                              ),
                            );
                          },
                        );

                        try {
                          var user = await registerUser(
                            signupController.email.text,
                            signupController.password.text,
                            signupController.userName.text,
                            signupController.firstName.text,
                            signupController.lastName.text,
                            signupController.phoneNumber.text,
                            signupController.postalCode.text,
                          );

                          Navigator.of(context).pop();

                          if (user != null) {
                            _showMessageDialog(context, "Registration successful!");
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ));
                          }
                        } catch (e) {
                          Navigator.of(context).pop();
                          _showMessageDialog(context, "Failed to register: $e");
                        }
                      }
                    },
                    child: const Text(CcTexts.createAccount),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
