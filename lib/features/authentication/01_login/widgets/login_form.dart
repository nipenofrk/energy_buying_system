import 'package:energy_trade/backend/services/back_end_system/aurh.dart';
import 'package:energy_trade/features/authentication/01_login/controller/login_controller.dart';
import 'package:energy_trade/features/authentication/01_login/forgot_password.dart';
import 'package:energy_trade/features/authentication/02_signup/signup.dart';
import 'package:energy_trade/features/shop/01_home/home.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:energy_trade/utils/constants/text_strings.dart';
import 'package:energy_trade/utils/helpers/helper_functions.dart';
import 'package:energy_trade/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoggingIn = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_isLoggingIn) return;

    setState(() {
      _isLoggingIn = true;
    });

    try {
      if (_formKey.currentState?.validate() ?? false) {
        var authRes = await userAuth(emailController.text, passwordController.text);
        if (authRes) {
          print("User authenticated successfully");
          if (mounted) {
            Get.off(() => const HomeScreen());  // Using GetX for navigation
          }
        }
      }
    } catch (e) {
      if (mounted) {
        _showError(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoggingIn = false;
        });
      }
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    // controller
    final loginController = Get.put(LoginController());

    // login form
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // email or username field
            TextFormField(
              controller: emailController,
              validator: (value) => CcValidator.validateEmail(value),
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.email_rounded),
                labelText: CcTexts.email,
                hintText: 'eg. john11@yahoo.com',
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnInputFields),

            // password
            Obx(
              () => TextFormField(
                controller: passwordController,
                validator: (value) =>
                    CcValidator.validateEmptyText('Password', value),
                obscureText: loginController.hidePassword.value,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => loginController.hidePassword.value =
                          !loginController.hidePassword.value,
                      icon: Icon(loginController.hidePassword.value
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded)),
                  labelText: CcTexts.password,
                  hintText: 'Enter your password',
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),

            // remember me and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: (value) => loginController.rememberMe.value =
                            !loginController.rememberMe.value,
                      ),
                    ),
                    Text(
                      CcTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: CcColors.black),
                    ),
                  ],
                ),

                // forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPasswordScreen()),
                  child: Text(
                    CcTexts.forgotPassword,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700),
                  ),
                )
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),

            // sign in button
            SizedBox(
              width: CcHelperFunctions.screenWidth() / 1.5,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CcColors.primary,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent),
                onPressed: _isLoggingIn ? null : _login,
                child: _isLoggingIn
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(CcTexts.signIn),
              ),
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_1),
            
            // signup button
            SizedBox(
              width: CcHelperFunctions.screenWidth() / 1.5,
              height: 60,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(
                  CcTexts.createAccount,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: CcColors.black,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
            const SizedBox(height: CcSizes.spaceBtnItems_2),
          ],
        ),
      ),
    );
  }
}
