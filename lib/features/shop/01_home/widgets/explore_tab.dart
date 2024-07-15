import 'package:energy_trade/common/containers/primary_header_container.dart';
import 'package:energy_trade/common/containers/section_heading.dart';
import 'package:energy_trade/features/shop/04_news/all_news.dart';
import 'package:energy_trade/features/shop/04_news/widgets/explore_vertical_summary_detail.dart';
import 'package:energy_trade/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploringTab extends StatefulWidget {
  const ExploringTab({
    super.key,
  });

  @override
  _ExploringTabState createState() => _ExploringTabState();
}

class _ExploringTabState extends State<ExploringTab> {
  final GlobalKey<AnimatedListState> _todayAnimatedListKey = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _topNewsAnimatedListKey = GlobalKey<AnimatedListState>();
  final List<Widget> _todayItems = [];
  final List<Widget> _topNewsItems = [];

  @override
  void initState() {
    super.initState();
    _addInitialItems();
  }

  void _addInitialItems() {
    final List<Widget> newTodayItems = [
      const ExploreVerticalSummaryDetail(),
      const ExploreVerticalSummaryDetail(),
      const ExploreVerticalSummaryDetail(),
    ];

    final List<Widget> newTopNewsItems = [
      const ExploreVerticalSummaryDetail(),
      const ExploreVerticalSummaryDetail(),
      const ExploreVerticalSummaryDetail(),
    ];

    for (var item in newTodayItems) {
      _todayItems.add(item);
      _todayAnimatedListKey.currentState?.insertItem(_todayItems.length - 1);
    }

    for (var item in newTopNewsItems) {
      _topNewsItems.add(item);
      _topNewsAnimatedListKey.currentState?.insertItem(_topNewsItems.length - 1);
    }

    _startContinuousAnimation();
  }

  void _startContinuousAnimation() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 2));
      _cycleList(_todayItems, _todayAnimatedListKey);
      await Future.delayed(const Duration(seconds: 2));
      _cycleList(_topNewsItems, _topNewsAnimatedListKey);
    }
  }

  void _cycleList(List<Widget> items, GlobalKey<AnimatedListState> key) async {
    if (items.isEmpty) return;
    final removedItem = items.removeAt(0);
    key.currentState?.removeItem(
      0,
      (context, animation) => _buildItem(removedItem, animation),
      duration: const Duration(milliseconds: 600),
    );

    await Future.delayed(const Duration(milliseconds: 600));

    items.add(removedItem);
    key.currentState?.insertItem(
      items.length - 1,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CcPrimaryHeaderContainer(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: CcSizes.spaceBtnItems_1),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Discover Trending and Latest News",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                          ),
                          const SizedBox(height: CcSizes.spaceBtnItems_1),
                          Text(
                            "Discover your news with easy trading",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                CcSectionHeading(
                  title: "Today",
                  showActionButton: true,
                  onPressed: () =>
                      Get.to(() => const AllNewsScreen(title: "Today's News")),
                ),
                SizedBox(
                  height: 250,
                  child: AnimatedList(
                    key: _todayAnimatedListKey,
                    initialItemCount: _todayItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index, animation) {
                      return _buildItem(_todayItems[index], animation);
                    },
                  ),
                ),
                const SizedBox(height: CcSizes.spaceBtnItems_1),
                CcSectionHeading(
                  title: "Top news",
                  showActionButton: true,
                  onPressed: () => Get.to(
                    () => const AllNewsScreen(
                      title: "Top News",
                      showWhen: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: AnimatedList(
                    key: _topNewsAnimatedListKey,
                    initialItemCount: _topNewsItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index, animation) {
                      return _buildItem(_topNewsItems[index], animation);
                    },
                  ),
                ),
                const SizedBox(height: CcSizes.spaceBtnItems_1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(Widget item, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: item,
    );
  }
}
