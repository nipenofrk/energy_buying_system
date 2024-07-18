import 'package:energy_trade/backend/services/back_end_system/aurh.dart';
import 'package:energy_trade/backend/services/service_api.dart';
import 'package:flutter/material.dart';
import 'package:energy_trade/features/shop/05_marketplace/widgets/marketplace_table_filter.dart';
import 'package:energy_trade/utils/constants/sizes.dart';

class MarketplaceTab extends StatefulWidget {
  const MarketplaceTab({super.key});

  @override
  _MarketplaceTabState createState() => _MarketplaceTabState();
}

class _MarketplaceTabState extends State<MarketplaceTab> {
  late Future<List<Provider>> futureProviders;
  final MarketClass apiService = MarketClass();
  String selectedCategory = "All Categories"; // Default selection

  @override
  void initState() {
    super.initState();
    futureProviders = apiService.fetchProviders();
  }

  @override
  Widget build(BuildContext context) {
    var categories = [
      "All Categories",
      "Solar",
      "Wind",
      "Biomass",
    ];

    var sellers = [
      "HE Power Solution",
      "Kwilasa's Rooftop",
      "Green Energy Corp",
      "Eco Bio Energy"
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: CcSizes.spaceBtnItems_1),
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
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          value: selectedCategory, // Set default value
                          items: categories.map((category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "All Categories",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder<List<Provider>>(
            future: futureProviders,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Text("No providers available");
              } else {
                var providerData = snapshot.data!;
                if (selectedCategory != "All Categories") {
                  providerData = providerData
                      .where((provider) =>
                          provider.category.toLowerCase() ==
                          selectedCategory.toLowerCase())
                      .toList();
                }

                var providersWithSellers = List.generate(
                  providerData.length,
                  (index) {
                    return {
                      'seller': sellers[index % sellers.length],
                      'price': '${providerData[index].price} tsh',
                      'kWh': '${providerData[index].kWh} kWh',
                      'category': providerData[index].category
                    };
                  },
                );

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      Colors.grey.withOpacity(0.3),
                    ),
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
                    rows: providersWithSellers.map((provider) {
                      return DataRow(
                        color: WidgetStateProperty.resolveWith(
                          (states) => Colors.grey.shade200,
                        ),
                        cells: [
                          DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  width: 70,
                                  child: Text(
                                    provider['seller']!,
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
                                    provider['price']!,
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
                                provider['kWh']!,
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
                                    provider['category']!,
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
                );
              }
            },
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
