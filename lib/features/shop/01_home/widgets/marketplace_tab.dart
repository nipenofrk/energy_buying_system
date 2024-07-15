import 'package:energy_trade/features/shop/05_marketplace/widgets/marketplace_table_filter.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MarketplaceTab extends StatelessWidget {
  const MarketplaceTab({super.key});

  @override
  Widget build(BuildContext context) {
    // categories
    var categories = [
      "Solar",
      "Wind",
      "Biomass",
    ];

    // providers details
    var providers = [
      {
        "seller": "HE Power Solution",
        "price": "400/=",
        "kWh": "10000 kWh",
        "category": "Solar"
      },
            {
        "seller": "Kwilasa's Rooftop",
        "price": "450/=",
        "kWh": "10000 kWh",
        "category": "Solar"
      },
      {
        "seller": "Green Energy Corp",
        "price": "500/=",
        "kWh": "8000 kWh",
        "category": "Wind"
      },
      {
        "seller": "Eco Bio Energy",
        "price": "450/=",
        "kWh": "4000 kWh",
        "category": "Biomass"
      },
    ];

    // content
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // summary on the energy owned by the user
                // const AnalyticsSummary(),
                //
                // const SizedBox(height: CcSizes.spaceBtnItems_1),
                //
                // // divider
                // const Divider(color: Colors.black26),

                const SizedBox(height: CcSizes.spaceBtnItems_1),

                // energy type
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Energy Type",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 16),
                      ),
                    ),

                    // filter box
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: DropdownButtonFormField(
                          items: categories.map((category) {
                            return DropdownMenuItem(
                                value: category, child: Text(category));
                          }).toList(),
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: "Solar"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
              columnSpacing: 25,
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Seller"),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Price"),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("kWh Available"),
                      ],
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Energy Category"),
                      ],
                    ),
                  ),
                ),
              ],
              rows: providers.map((provider) {
                return DataRow(
                  color: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey.shade200),
                  cells: [
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: 70,
                            child: Text(
                              provider["seller"]!,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Container(
                          color: Colors.transparent,
                          width: 50,
                          child: Center(
                            child: Text(
                              provider["price"]!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                          provider["kWh"]!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              provider["category"]!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),

          const Divider(),

          const SizedBox(height: CcSizes.spaceBtnItems_1),

          const MarketplaceTableFilter(),

          const SizedBox(height: CcSizes.spaceBtnItems_2),
        ],
      ),
    );
  }
}
