import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training_app/features/restaurant_info_home/presentation/item_details_screen.dart';
import 'package:training_app/features/restaurant_info_home/presentation/restaurant_info_screen.dart';
import 'package:training_app/gen/assets.gen.dart';

class RestaurantTestScreen extends StatefulWidget {
  const RestaurantTestScreen({super.key});

  @override
  State<RestaurantTestScreen> createState() => _RestaurantTestScreenState();
}

class _RestaurantTestScreenState extends State<RestaurantTestScreen> {

  final scrollController = ScrollController();

  double restaurantInfoHeight = 200 +170 -kToolbarHeight;

  @override
  void initState() {
    super.initState();
scrollController.addListener(() {
    log(scrollController.offset as String);
},);
  }

  void scrollToCategory(int index){
    scrollController.animateTo(restaurantInfoHeight, duration: Duration(milliseconds: 500 ), curve: Curves.ease);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const RestaurantAppBar(),
          SliverToBoxAdapter(
            child: Container(
              height: 90,
              decoration: const BoxDecoration(color: Colors.amber),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 40,
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //           children: List.generate(
          //         10,
          //         (index) => Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 10),
          //           child: ItemsWidget(
          //             text: "jnjknk",
          //             currentIndex: index,
          //             selectedIndex: 0,
          //             onTap: () async {
          //               // await getCategoryResultRxObj.getCategoryResultRx(
          //               //     id: categorySnapIndex.menuId ?? 1);
          //               // setState(() {
          //               //   selectedIndex = index;
          //               //   itemName = categorySnapIndex.menuName ?? "";
          //               // });
          //               // _scrollToItem(index);
          //             },
          //           ),
          //         ),
          //       )),
          //     ),
          //   ),
          // ),
          SliverPersistentHeader(
              pinned: true,
              delegate: RestaurantCategories(
                onChanged:scrollToCategory,
                selectedIndex: 0,
              )),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 16,
              (context, index) {
                return FoodItemWidget(
                  imgPath:
                      "https://images.pexels.com/photos/15295923/pexels-photo-15295923/free-photo-of-bouquet-of-flowers-in-clothing-with-feelings-written-on-it.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load",
                  title: "kbjbbj",
                  description:
                      "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil",
                  rating: "kbjbkb",
                  currentPrice: "123",
                  previousPrice: "150",
                  onTap: () async {
                    // FoodDetailsResponseModel? res = await getFoodDetailsRxObj
                    //     .getFoodDetailsRx(foodId: catResultIndex.foodId ?? 2);
                    // if (res!.data!.isShowVariant! == true) {
                    //   log("--------------is variant true----------------------------------");
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ItemDetailsScreen(
                    //               imgUrl: res.data!.foodImage ?? "",
                    //               foodName: res.data!.foodName ?? "N/A",
                    //               foodPrice: res.data!.foodPrice ?? 0,
                    //             )),
                    //   );
                    //   //  NavigationService.navigateTo(Routes.itemDetailsScreen);
                    // } else {
                    //   bottomSheet(
                    //     imgUrl: res.data!.foodImage ?? "",
                    //     foodName: res.data!.foodName ?? "N/A",
                    //     foodPrice: res.data!.foodPrice ?? 0,
                    //   );

                    //   log("--------------is variant false----------------------------------");
                    // }
                  },
                );
              },
            )),
          )
        ],
      ),
    );
  }
}

class RestaurantCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  RestaurantCategories({required this.onChanged, required this.selectedIndex});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: 52,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                onChanged(index);
              },
              child: ItemsWidget(
                text: "jnjknk",
                currentIndex: index,
                selectedIndex: 0,
                onTap: () async {
                  // await getCategoryResultRxObj.getCategoryResultRx(
                  //     id: categorySnapIndex.menuId ?? 1);
                  // setState(() {
                  //   selectedIndex = index;
                  //   itemName = categorySnapIndex.menuName ?? "";
                  // });
                  // _scrollToItem(index);
                },
              ),
            ),
          ),
        )),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 52;

  @override
  // TODO: implement minExtent
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          Assets.images.foodImg.path,
          fit: BoxFit.cover,
        ),
      ),
      leading: const CircleAvatar(
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: const [
        CircleAvatar(
          child: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
