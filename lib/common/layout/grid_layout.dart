import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CcGridLayout extends StatelessWidget {
  const CcGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 380,
    required this.itemBuilder,
    this.crossAxisItemCount = 1,
  });

  final int itemCount, crossAxisItemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisItemCount,
        mainAxisSpacing: CcSizes.sm,
        crossAxisSpacing: CcSizes.sm,
        mainAxisExtent: 250,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
