import 'package:energy_trade/common/login_signup/form_divider.dart';
import 'package:energy_trade/common/login_signup/social_buttons.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CcColors.primary,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "New Account",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade100,
              ),
        ),
      ),
      backgroundColor: CcColors.secondary,
      body:   SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              SignupForm(),

              // divider
              const FormDivider(dividerText: "Or Sign In With"),

              const SizedBox(height: CcSizes.spaceBtnSections / 2),

              // social button
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
