import 'package:energy_trade/backend/services/back_end_system/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  final String iconUrl;
  final String hint;
  TextEditingController? controller;

 CustomField({super.key, 
    this.controller,
    this.iconUrl = '',
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(
          color: kWhiteColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            height: 26,
            width: 26,
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  iconUrl,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}