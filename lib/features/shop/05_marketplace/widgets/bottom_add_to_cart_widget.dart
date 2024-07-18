import 'package:energy_trade/features/shop/06_checkout/checkout.dart';
import 'package:energy_trade/utils/constants/colors.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({
    super.key,
    required this.energyClass,
    required this.supplier,
    required this.status,
    required this.pricePerUnit,
    required this.units,
    required this.totalPrice,
    required this.address,
  });

  final String energyClass;
  final String supplier;
  final String status;
  final double pricePerUnit;
  final int units;
  final double totalPrice;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(CcSizes.cardRadiusXs),
                  color: CcColors.grey,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(CcSizes.cardRadiusXs),
                      ),
                    ),
                    child: const SizedBox(
                      width: CcSizes.iconLg,
                      height: CcSizes.iconLg,
                      child: Center(
                        child: Icon(Iconsax.minus, color: CcColors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: CcSizes.spaceBtnItems_1),
                Text("2 kWh", style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: CcSizes.spaceBtnItems_1),
                InkWell(
                  onTap: () {},
                  child: Material(
                    elevation: 5,
                    color: CcColors.dark,
                    borderRadius: BorderRadius.circular(CcSizes.cardRadiusXs),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(CcSizes.cardRadiusXs),
                        ),
                      ),
                      child: const SizedBox(
                        width: CcSizes.iconLg,
                        height: CcSizes.iconLg,
                        child: Center(
                          child: Icon(Iconsax.add, color: CcColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () => Get.to(() => CheckoutScreen(
                      energyClass: energyClass,
                      supplier: supplier,
                      status: status,
                      pricePerUnit: pricePerUnit,
                      units: units,
                      totalPrice: totalPrice,
                      address: address,
                    )),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(CcSizes.md),
                  backgroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                ),
                child: Center(
                  child: Text(
                    "Buy",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CcColors.white,
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
}
