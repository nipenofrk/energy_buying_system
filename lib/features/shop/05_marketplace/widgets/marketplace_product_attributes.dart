import 'package:energy_trade/common/containers/product_price_text.dart';
import 'package:energy_trade/common/containers/product_title_text.dart';
import 'package:energy_trade/common/texts/section_heading.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MarketplaceProductAttributes extends StatelessWidget {
  const MarketplaceProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    // controller

    // column
    return Column(
      children: [
        const SizedBox(height: 10),

        // selected attribute pricing and description
        Material(
          elevation: 5,
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const CcSectionHeading(
                        title: "Seller     ", showActionButton: false),
                    const SizedBox(width: CcSizes.spaceBtnItems_1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // seller name
                            const CcProductTitleText(
                                title: "name\t\t\t   : ", smallSize: true),
                            const SizedBox(width: CcSizes.spaceBtnItems_1 + 10),
                            Text(
                              "HE Power Solution",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // location
                        Row(
                          children: [
                            const CcProductTitleText(
                                title: "location :", smallSize: true),
                            const SizedBox(width: CcSizes.spaceBtnItems_1 + 10),
                            Text(
                              "DSM",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: CcSizes.spaceBtnItems_2),

                const Divider(),

                const SizedBox(height: CcSizes.spaceBtnItems_2),

                // title, price and stock status
                Row(
                  children: [
                    const CcSectionHeading(
                        title: "Product", showActionButton: false),
                    const SizedBox(width: CcSizes.spaceBtnItems_1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CcProductTitleText(
                                title: "price\t\t\t     : ", smallSize: true),

                            const SizedBox(width: CcSizes.spaceBtnItems_1 + 6),

                            // sale price
                            Row(
                              children: [
                                const CcProductPriceText(
                                  price: "400",
                                  color: Colors.blue,
                                ),
                                Text(
                                  " per kWh",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontSize: 15, color: Colors.blue),
                                  softWrap: true,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // status: may be "available with no of plates or products" or "out of order"
                        Row(
                          children: [
                            const CcProductTitleText(
                                title: "status\t    : ", smallSize: true),
                            const SizedBox(width: CcSizes.spaceBtnItems_1 + 8),
                            Text(
                              "Available",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // quantity
                        Row(
                          children: [
                            const CcProductTitleText(
                                title: "quantity : ", smallSize: true),
                            const SizedBox(width: CcSizes.spaceBtnItems_1 + 8),
                            Text(
                              "100 kWh",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),

                const Divider(),

                // title, price and stock status
                // Row(
                //   children: [
                //     const CcSectionHeading(
                //         title: "Other     ", showActionButton: false),
                //     const SizedBox(width: CcSizes.spaceBtnItems_1),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             const CcProductTitleText(
                //                 title: "delivery : ", smallSize: true),

                //             const SizedBox(width: CcSizes.spaceBtnItems_1 + 3),

                //             // sale price
                //             Row(
                //               children: [
                //                 Text(
                //                   "   7 days",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .headlineSmall!
                //                       .copyWith(
                //                           fontSize: 15, color: Colors.blue),
                //                   softWrap: true,
                //                   maxLines: 3,
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),

                //         const SizedBox(height: 10),

                //         // status: may be "available with no of plates or products" or "out of order"
                //         Row(
                //           children: [
                //             const CcProductTitleText(
                //                 title: "billing    : ", smallSize: true),
                //             const SizedBox(width: CcSizes.spaceBtnItems_1 + 10),
                //             Text(
                //               " Monthly",
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .titleSmall!o
                //                   .copyWith(
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.blue),
                //             ),
                //           ],
                //         ),

                //         const SizedBox(height: 10),

                //         // terms
                //         Row(
                //           children: [
                //             const CcProductTitleText(
                //                 title: "terms     : ", smallSize: true),
                //             const SizedBox(width: CcSizes.spaceBtnItems_1 + 12),
                //             Text(
                //               "Max 20 kWh per buyer",
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .titleSmall!
                //                   .copyWith(
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.blue),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),

        // const SizedBox(height: CcSizes.spaceBtnItems_1),
      ],
    );
  }
}
