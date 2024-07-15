import 'package:energy_trade/backend/services/back_end_system/theme.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  VoidCallback? onTap;
  final String title;
  final EdgeInsets margin;

 CustomTextButton({super.key, 
    this.title = '',
    this.margin = EdgeInsets.zero,
    this.onTap, required child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: margin,
      child: TextButton(
        onPressed:onTap,
        style: TextButton.styleFrom(
           backgroundColor: CcColors.primary,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent),
        
        child: Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}