import 'package:energy_trade/common/login_signup/form_divider.dart';
import 'package:energy_trade/features/authentication/01_login/widgets/login_form.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:energy_trade/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    final screenHeight = CcHelperFunctions.screenHeight();
    return Scaffold(
      backgroundColor: CcColors.secondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight / 7),

            // lock icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: CcColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                    ),
                    const SizedBox(height: CcSizes.spaceBtnItems_2 / 3),
                    Text(
                      "Please Login To Continue",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: CcSizes.spaceBtnItems_2),

           const LoginForm(),
            

            const FormDivider(dividerText: "Or Sign In With"),

            const SizedBox(height: CcSizes.spaceBtnItems_1),

            //const SocialButton()
          ],
        ),
      ),
    );
  }
}
