import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:training_app/common_widgets/custom_text_field.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/features/restaurant_info_home/model/category_result.dart';
import 'package:training_app/features/restaurant_info_home/model/category_tab_response_model.dart';
import 'package:training_app/features/restaurant_info_home/model/food_details_model.dart';
import 'package:training_app/features/restaurant_info_home/model/offer_card_model.dart';
import 'package:training_app/features/restaurant_info_home/presentation/item_details_screen.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/ui_helpers.dart';
import 'package:training_app/networks/api_acess.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../model/restaurant_info_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../model/restaurant_info_model.dart';

class RestaurantInfoHomeScreen extends StatefulWidget {
  const RestaurantInfoHomeScreen({super.key});

  @override
  State<RestaurantInfoHomeScreen> createState() =>
      _RestaurantInfoHomeScreenState();
}

class _RestaurantInfoHomeScreenState extends State<RestaurantInfoHomeScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() async {
    await getRestaurantInfoRxObj.getRestaurantInfoRx();
    await getOfferCardRxObj.getOfferCardRx();
    await getCategoryTabRxObj.getCategoryTabRx();
    await getCategoryResultRxObj.getCategoryResultRx(id: 1);
  }

  final ScrollController _scrollController = ScrollController();
  void _scrollToItem(int targetIndex) {
    final double itemWidth = 55.w;
    final double spacing = 20.w;
    final double targetOffset = targetIndex * (itemWidth + spacing);

    final double currentOffset = _scrollController.offset;

    if (targetOffset < currentOffset) {
      _scrollController.animateTo(
        targetOffset - (2 * (itemWidth + spacing)),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (targetOffset > currentOffset + (3 * (itemWidth + spacing))) {
      _scrollController.animateTo(
        targetOffset - (2 * (itemWidth + spacing)),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  String itemName = "";
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder<RestaurantInfoResponseModel>(
            stream: getRestaurantInfoRxObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: size.height*0.44,),
                    Center(child: CircularProgressIndicator()),
                  ],
                ));
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Snapshot has error"));
              }
              if (snapshot.hasData) {
                final snap = snapshot.data!.data;
                return SafeArea(
                  child: Stack(
                    children: [
                      const Column(),
                      //<<----------img and icons section start----------->>
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                // Assets.images.foodImg.path,
                                snap!.profileImageUrl!,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                height: 250.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 16.w, right: 16.w, top: 16.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      Assets.icons.arrowBackIcon.path,
                                      width: 24.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Assets.icons.heartIcon.path,
                                          width: 24.w,
                                        ),
                                        UIHelper.horizontalSpace(13.w),
                                        Image.asset(
                                          Assets.icons.searchIcon.path,
                                          width: 24.w,
                                        ),
                                        UIHelper.horizontalSpace(13.w),
                                        Image.asset(
                                          Assets
                                              .icons.verticalThreeDotsIcon.path,
                                          width: 24.w,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      //<<----------img and icons section end----------->>
                      Column(
                        children: [
                          SizedBox(
                            height: 230.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            width: double.maxFinite,
                            decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22.r),
                                        topRight: Radius.circular(22.r)))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //<<----------restaurant title and rating sections start here----------->>
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: Text(
                                            // "Off-beat Restaurant",
                                            snap.name ?? "N/A",
                                            style: TextFontStyle
                                                .text20w700c000000Urbanist,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )),
                                          UIHelper.horizontalSpace(3.w),
                                          Image.asset(
                                            Assets.icons.warningIcon.path,
                                            width: 24.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(30.w),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              Assets.icons.starIconPng.path,
                                              width: 18.w,
                                              height: 18.h,
                                            ),
                                            UIHelper.horizontalSpace(3.w),
                                            Text(
                                              snap.averageRating ?? "N/A",
                                              style: TextFontStyle
                                                  .text14w600c2D3034Urbanist,
                                            )
                                          ],
                                        ),
                                        Text(
                                          '${snap.totalRating ?? "N/A"} ratings',
                                          style: TextFontStyle
                                              .text10w600c90969DUrbanist,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpace(12.h),
                                //<<----------restaurant title and rating sections end here----------->>
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.icons.durationIconPng.path,
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: " Delivery ",
                                              style: TextFontStyle
                                                  .text12w500c90969DUrbanist
                                                  .copyWith(fontSize: 13.sp)),
                                          TextSpan(
                                              text: snap.averageDeliveryTime ??
                                                  "N/A",
                                              style: TextFontStyle
                                                  .text12w500c5D636AUrbanist
                                                  .copyWith(fontSize: 13.sp))
                                        ])),
                                        UIHelper.horizontalSpace(6.w),
                                        const CircleAvatar(
                                          backgroundColor: AppColors.cC6C9CD,
                                          radius: 2,
                                        ),
                                      ],
                                    ),
                                    UIHelper.horizontalSpace(6.w),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.icons.locationIconPng.path,
                                          width: 20.w,
                                          height: 20.h,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: snap.distance ?? "N/A",
                                              style: TextFontStyle
                                                  .text12w500c5D636AUrbanist
                                                  .copyWith(fontSize: 13.sp)),
                                          TextSpan(
                                              text: "away",
                                              style: TextFontStyle
                                                  .text12w500c90969DUrbanist
                                                  .copyWith(fontSize: 13.sp)),
                                        ])),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Review",
                                      style: TextFontStyle
                                          .text14w700cA1045AUrbanist,
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpace(12.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.icons.bikeIconPng.path,
                                      width: 22.w,
                                      height: 22.h,
                                    ),
                                    Text(
                                      // 'Free delivery',
                                      snap.deliveryMode ?? "N/A",
                                      style: TextFontStyle
                                          .text12w700cA1045ADUrbanist
                                          .copyWith(fontSize: 13.sp),
                                    ),
                                    UIHelper.horizontalSpace(6.w),
                                    const CircleAvatar(
                                      backgroundColor: AppColors.cC6C9CD,
                                      radius: 2,
                                    ),
                                    UIHelper.horizontalSpace(6.w),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "Min order",
                                          style: TextFontStyle
                                              .text12w500c90969DUrbanist
                                              .copyWith(fontSize: 13.sp)),
                                      TextSpan(
                                          text:
                                              " ${snap.minOrderAmount ?? 0} ${snap.currency ?? "N/A"}  ",
                                          style: TextFontStyle
                                              .text12w500c5D636AUrbanist
                                              .copyWith(fontSize: 13.sp))
                                    ])),
                                    const Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(4.sp),
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: AppColors.cE1E3E5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                      )),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Assets.icons.warningIcon.path,
                                            width: 14.w,
                                            height: 14.h,
                                          ),
                                          UIHelper.horizontalSpace(3.w),
                                          Text(
                                            "More Info",
                                            style: TextFontStyle
                                                .text14w600c757D85Urbanist,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                UIHelper.verticalSpace(24.h),
                                StreamBuilder<OfferCardModel>(
                                    stream: getOfferCardRxObj.dataFetcher,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasError) {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }
                                      if (snapshot.hasData) {
                                        final offerCardSnap =
                                            snapshot.data!.data;
                                        return SizedBox(
                                          height: size.height * 0.13,
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final offerCardSnapIndex =
                                                  offerCardSnap[index];
                                              return OfferCardWidget(
                                                size: size,
                                                bgImgPath: (index % 2 == 0)
                                                    ? Assets
                                                        .images.offerImg1Bg.path
                                                    : Assets.images.offerImg2Bg
                                                        .path,
                                                starIconPath: (index % 2 == 0)
                                                    ? Assets.icons.starOffer1Img
                                                        .path
                                                    : Assets.icons.starOffer2Img
                                                        .path,
                                                discountPercentage:
                                                    offerCardSnapIndex
                                                            .discount ??
                                                        "N/A",
                                                currency: (offerCardSnapIndex
                                                            .minimumOrderAmount ??
                                                        0)
                                                    .toString(),
                                                deliveryMood: offerCardSnapIndex
                                                        .deliveryMode ??
                                                    "N/A",
                                                color: AppColors.c640238,
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              width: 10,
                                            ),
                                            itemCount: offerCardSnap!.length,
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }
                                    }),

                                UIHelper.verticalSpace(20.h),


                                // TabBar
                                StreamBuilder<CategoryTabResponseModel>(
                                    stream: getCategoryTabRxObj.dataFetcher,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasError) {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }
                                      if (snapshot.hasData) {
                                        final categorySnap =
                                            snapshot.data!.data!;
                                        itemName = categorySnap[0].menuName!;
                                        return SizedBox(
                                          height: 80.h,
                                          child: ListView.separated(
                                              controller: _scrollController,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                final categorySnapIndex =
                                                    categorySnap[index];
                                                return ItemsWidget(
                                                  text: categorySnapIndex
                                                          .menuName ??
                                                      " N/A",
                                                  currentIndex: index,
                                                  selectedIndex: selectedIndex,
                                                  onTap: () async {
                                                    await getCategoryResultRxObj
                                                        .getCategoryResultRx(
                                                            id: categorySnapIndex
                                                                    .menuId ??
                                                                1);
                                                    setState(() {
                                                      selectedIndex = index;
                                                      itemName =
                                                          categorySnapIndex
                                                                  .menuName ??
                                                              "";
                                                    });
                                                    _scrollToItem(index);
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                              itemCount: categorySnap.length),
                                        );
                                      } else {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }
                                    }),

                                UIHelper.verticalSpace(20.h),
                                const Divider(
                                  color: Colors.grey,
                                  height: 1,
                                  thickness: 5,
                                ),
                                UIHelper.verticalSpace(20.h),
                                Row(
                                  children: [
                                    Text(
                                      itemName,
                                      style: TextFontStyle
                                          .text16w800c2D3034Urbanist,
                                    ),
                                    UIHelper.horizontalSpace(3.w),
                                    Image.asset(
                                      Assets.icons.pizzaIcon.path,
                                      width: 23.w,
                                    )
                                  ],
                                ),
                                StreamBuilder<CategoryResultResponseModel>(
                                    stream: getCategoryResultRxObj.dataFetcher,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasError) {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }

                                      if (snapshot.hasData) {
                                        final catResult = snapshot.data!.data!;
                                        return ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            final catResultIndex =
                                                catResult[index];
                                            return FoodItemWidget(
                                              imgPath:
                                                  catResultIndex.foodImage ??
                                                      "N/A",
                                              title: catResultIndex.foodName ??
                                                  "N/A",
                                              description:
                                                  "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil",
                                              rating: catResultIndex.rating ??
                                                  "N/A",
                                              currentPrice:
                                                  (catResultIndex.foodPrice ??
                                                          "N/A")
                                                      .toString(),
                                              previousPrice: "150",
                                              onTap: () async {
                                                FoodDetailsResponseModel? res =
                                                    await getFoodDetailsRxObj
                                                        .getFoodDetailsRx(
                                                            foodId: catResultIndex
                                                                    .foodId ??
                                                                2);
                                                if (res!.data!.isShowVariant! ==
                                                    true) {
                                                  log("--------------is variant true----------------------------------");
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ItemDetailsScreen(
                                                                imgUrl: res.data!.foodImage ??
                                                            "",
                                                                foodName:
                                                                   res.data!.foodName ??
                                                            "N/A",
                                                                foodPrice:
                                                                    res.data!.foodPrice ??
                                                            0,)),
                                                  );
                                                  //  NavigationService.navigateTo(Routes.itemDetailsScreen);
                                                } else {
                                                  bottomSheet(
                                                    imgUrl:
                                                        res.data!.foodImage ??
                                                            "",
                                                    foodName:
                                                        res.data!.foodName ??
                                                            "N/A",
                                                    foodPrice:
                                                        res.data!.foodPrice ??
                                                            0,
                                                  );

                                                  log("--------------is variant false----------------------------------");
                                                }
                                              },
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 10,
                                          ),
                                          itemCount: catResult.length,
                                        );
                                      } else {
                                        return const Center(
                                            child: Text("Snapshot has error"));
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Snapshot has error"));
              }
            }),
      ),
    );
  }

  int count = 0;
  void bottomSheet({
    required String imgUrl,
    required String foodName,
    required double foodPrice,
  }) {
    showModalBottomSheet(
      isScrollControlled: true, // Allows the bottom sheet to take more height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7, // Adjust height
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // Adjust for keyboard
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child: Image.network(
                      imgUrl,
                      width: double.maxFinite,
                      height: 230.h,
                      fit: BoxFit.cover,
                    )),
                UIHelper.verticalSpace(20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: TextFontStyle.text20w700c000000Urbanist,
                      ),
                      UIHelper.verticalSpace(5.h),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Dignissim pulvinar non viverra pellentesque sollicitudin non risus. Proin a placerat nullam scelerisque tortor sit et sed semper.",
                        style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                          color: const Color(0xFF757D85),
                        ),
                      ),
                      UIHelper.verticalSpace(40.h),
                      ItemCountWidget(
                        price: foodPrice,
                        numOfItem: count,
                        onDeleteTap: () {
                          setState(() {
                            count--;
                          });
                        },
                        onAddTap: () {
                          setState(() {
                            count++;
                          });
                        },
                      ),
                      UIHelper.verticalSpace(10.h),
                      AddToCartButton(
                        onTap: () {},
                      ),
                      UIHelper.verticalSpace(10.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String imgPath, title, description, rating, currentPrice, previousPrice;

  const FoodItemWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.description,
    required this.rating,
    required this.currentPrice,
    required this.previousPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.cE1E3E5),
          borderRadius: BorderRadius.circular(10.r),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgPath,
              width: 92.w,
              height: 92.h,
              fit: BoxFit.cover,
            ),
            UIHelper.horizontalSpace(15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title, //"Pizza margherita",
                        style: TextFontStyle.text20w700cFFFFFFUrbanist.copyWith(
                            color: const Color(0xFF2D3034), fontSize: 14.sp),
                      ),
                      Container(
                        padding: EdgeInsets.all(4.sp),
                        decoration: ShapeDecoration(
                            color: const Color(0xFFFEE9CD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r))),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.icons.starIconPng.path,
                              width: 12.w,
                            ),
                            UIHelper.horizontalSpace(3.w),
                            Text(
                              rating,
                              style: TextFontStyle.text10w600c90969DUrbanist
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  UIHelper.verticalSpace(3.h),
                  Text(
                    // "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil",
                    description,
                    textAlign: TextAlign.start,
                    style: TextFontStyle.text12w500c5D636AUrbanist
                        .copyWith(color: const Color(0xFF757D85)),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.fireIcon.path,
                        width: 12.w,
                      ),
                      UIHelper.horizontalSpace(3.w),
                      Text(
                        "Popular",
                        style: TextFontStyle.text10w600c90969DUrbanist.copyWith(
                            color: const Color(0xFF2D3034), fontSize: 11.sp),
                      )
                    ],
                  ),
                  UIHelper.verticalSpace(5.h),
                  Row(
                    children: [
                      Text(
                        "AED $currentPrice",
                        style: TextFontStyle.text14w600c2D3034Urbanist
                            .copyWith(color: const Color(0xFFA1045A)),
                      ),
                      UIHelper.horizontalSpace(5.w),
                      Text(
                        "AED $previousPrice",
                        style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                          color: const Color(0xFF5D636A),
                          fontSize: 14.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        Assets.icons.plusIcon.path,
                        width: 23.w,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  final String text;
  final int currentIndex, selectedIndex;
  final VoidCallback onTap;

  const ItemsWidget({
    super.key,
    required this.text,
    required this.currentIndex,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: ShapeDecoration(
                color: currentIndex == selectedIndex
                    ? AppColors.cA1045A
                    : AppColors.cffffff,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: AppColors.cE1E3E5,
                  ),
                  borderRadius: BorderRadius.circular(30.r),
                )),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextFontStyle.text20w700cFFFFFFUrbanist.copyWith(
                      fontSize: 14.sp,
                      color: currentIndex == selectedIndex
                          ? AppColors.cffffff
                          : Colors.grey),
                ),
                UIHelper.horizontalSpace(3.w),
                if (currentIndex == selectedIndex)
                  Image.asset(
                    Assets.icons.fireIcon.path,
                    width: 16.w,
                    height: 16.h,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OfferCardWidget extends StatelessWidget {
  final String bgImgPath,
      starIconPath,
      discountPercentage,
      currency,
      deliveryMood;
  final Color color;

  const OfferCardWidget({
    super.key,
    required this.size,
    required this.bgImgPath,
    required this.starIconPath,
    required this.discountPercentage,
    required this.currency,
    required this.color,
    required this.deliveryMood,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      bgImgPath,
                    ),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 32.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        starIconPath,
                        width: 24,
                        height: 24.h,
                      ),
                      UIHelper.horizontalSpace(10.w),
                      Text(
                        "$discountPercentage% off",
                        style: TextFontStyle.text20w700cFFFFFFUrbanist,
                      ),
                      UIHelper.horizontalSpace(15.w),
                      Text(
                        "upto $currency AED",
                        style: TextFontStyle.text12w500cEFEFEFUrbanist,
                      )
                    ],
                  ),
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: size.width * 0.68,
                        decoration: ShapeDecoration(
                            color: color,
                            shape: const RoundedRectangleBorder()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.icons.cycleWhiteIcon.path,
                                width: 18,
                              ),
                              UIHelper.horizontalSpace(3.w),
                              Text(
                                deliveryMood,
                                style: TextFontStyle.text10w600cFFFFFFUrbanist,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:training_app/common_widgets/custom_text_field.dart';
// import 'package:training_app/constants/text_font_style.dart';
// import 'package:training_app/gen/assets.gen.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/helpers/ui_helpers.dart';
// import 'package:training_app/networks/api_acess.dart';


// import '../../../gen/assets.gen.dart';
// import '../../../gen/colors.gen.dart';
// import '../model/restaurant_info_model.dart';

// class RestaurantInfoHomeScreen extends StatefulWidget {
//   const RestaurantInfoHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<RestaurantInfoHomeScreen> createState() => _RestaurantInfoHomeScreenState();
// }

// class _RestaurantInfoHomeScreenState extends State<RestaurantInfoHomeScreen> {
//   int selectedIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     getRestaurantInfoRxObj.getRestaurantInfoRx();
//   }
//   final ScrollController _scrollController =
//       ScrollController(); // Controller for ListView
//   // Function to scroll to the clicked item
//   void _scrollToItem(int targetIndex) {
//     // Calculate the offset for the target item
//     final double itemWidth = 55.w; // Adjust based on your item width
//     final double spacing = 20.w; // Adjust based on your separator width
//     final double targetOffset = targetIndex * (itemWidth + spacing);

//     // Get the current scroll position
//     final double currentOffset = _scrollController.offset;

//     // Determine scroll direction
//     if (targetOffset < currentOffset) {
//       // Scroll left if the target is to the left of the current position
//       _scrollController.animateTo(
//         targetOffset - (2 * (itemWidth + spacing)),
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     } else if (targetOffset > currentOffset + (3 * (itemWidth + spacing))) {
//       // Scroll right if the target is to the right of the visible area
//       // Here, `3` is the number of visible items. Adjust based on your UI.
//       _scrollController.animateTo(
//         targetOffset - (2 * (itemWidth + spacing)),
//         // Adjust to bring the target into view
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       );
//     }
//   }


//   @override
//   void dispose() {
//     _scrollController.dispose(); // Dispose the controller when not needed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: StreamBuilder<RestaurantInfoResponseModel>(
//           stream: getRestaurantInfoRxObj.dataFetcher,
//           builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return Center(child: CircularProgressIndicator());
//             }
//             if(snapshot.hasError){
//               return Center(child: Text("Snapshot has error"));
//             }
//             if(snapshot.hasData){
//               final snap = snapshot.data!.data;
//               return SafeArea(
//                 child: Stack(
//                   children: [
//                     Column(),
//                     //<<----------img and icons section start----------->>
//                     Column(
//                       children: [
//                         Stack(
//                           children: [
//                             Image.network(
//                               // Assets.images.foodImg.path,
//                               snap!.profileImageUrl!,
//                               width: double.maxFinite,
//                               fit: BoxFit.cover,
//                               height: 250.h,
//                             ),
//                             Padding(
//                               padding:
//                               EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   SvgPicture.asset(
//                                     Assets.icons.arrowBackSvgIcon,
//                                     width: 24.w,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.icons.heartSvgIcon,
//                                         width: 24.w,
//                                       ),
//                                       UIHelper.horizontalSpace(13.w),
//                                       SvgPicture.asset(
//                                         Assets.icons.searchSvgIcon,
//                                         width: 24.w,
//                                       ),
//                                       UIHelper.horizontalSpace(13.w),
//                                       SvgPicture.asset(
//                                         Assets.icons.verticalThreeDotsSvgIcon,
//                                         width: 24.w,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                     //<<----------img and icons section end----------->>
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 230.h,
//                         ),
//                         Container(
//                           padding:
//                           EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//                           width: double.maxFinite,
//                           decoration: ShapeDecoration(
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(22.r),
//                                       topRight: Radius.circular(22.r)))),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               //<<----------restaurant title and rating sections start here----------->>
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Row(
//                                       children: [
//                                         Flexible(
//                                             child: Text(
//                                               // "Off-beat Restaurant",
//                                              snap.name ?? "N/A",
//                                               style:
//                                               TextFontStyle.text20w700c000000Urbanist,
//                                               overflow: TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                             )),
//                                         UIHelper.horizontalSpace(3.w),
//                                         SvgPicture.asset(
//                                           Assets.icons.warningSvgIcon,
//                                           width: 24.w,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   UIHelper.horizontalSpace(30.w),
//                                   Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SvgPicture.asset(
//                                             Assets.icons.starIcon,
//                                             width: 18.w,
//                                             height: 18.h,
//                                           ),
//                                           UIHelper.horizontalSpace(3.w),
//                                           Text(
//                                             snap.averageRating ?? "N/A",
//                                             style: TextFontStyle
//                                                 .text14w600c2D3034Urbanist,
//                                           )
//                                         ],
//                                       ),
//                                       Text(
//                                         '${snap.totalRating ?? "N/A"} ratings',
//                                         style:
//                                         TextFontStyle.text10w600c90969DUrbanist,
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               UIHelper.verticalSpace(12.h),
//                               //<<----------restaurant title and rating sections end here----------->>
//                               Row(
//                                 children: [
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.icons.durationIcon,
//                                         width: 20.w,
//                                         height: 20.h,
//                                       ),
//                                       RichText(
//                                           text: TextSpan(children: [
//                                             TextSpan(
//                                                 text: " Delivery ",
//                                                 style: TextFontStyle
//                                                     .text12w500c90969DUrbanist
//                                                     .copyWith(fontSize: 13.sp)),
//                                             TextSpan(
//                                                 text:snap.averageDeliveryTime ?? "N/A",
//                                                 style: TextFontStyle
//                                                     .text12w500c5D636AUrbanist
//                                                     .copyWith(fontSize: 13.sp))
//                                           ])),
//                                       UIHelper.horizontalSpace(6.w),
//                                       const CircleAvatar(
//                                         backgroundColor: AppColors.cC6C9CD,
//                                         radius: 2,
//                                       ),
//                                     ],
//                                   ),
//                                   UIHelper.horizontalSpace(6.w),
//                                   Row(
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         Assets.icons.locationIcon,
//                                         width: 20.w,
//                                         height: 20.h,
//                                       ),
//                                       RichText(
//                                           text: TextSpan(children: [
//                                             TextSpan(
//                                                 text: snap.distance ?? "N/A",
//                                                 style: TextFontStyle
//                                                     .text12w500c5D636AUrbanist
//                                                     .copyWith(fontSize: 13.sp)),
//                                             TextSpan(
//                                                 text: "away",
//                                                 style: TextFontStyle
//                                                     .text12w500c90969DUrbanist
//                                                     .copyWith(fontSize: 13.sp)),
//                                           ])),
//                                     ],
//                                   ),
//                                   Spacer(),
//                                   Text(
//                                     "Review",
//                                     style: TextFontStyle.text14w700cA1045AUrbanist,
//                                   )
//                                 ],
//                               ),
//                               UIHelper.verticalSpace(12.h),
//                               Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     Assets.icons.bikeIcon,
//                                     width: 22.w,
//                                     height: 22.h,
//                                   ),
//                                   Text(
//                                     // 'Free delivery',
//             snap.deliveryMode ?? "N/A",
//                                     style: TextFontStyle.text12w700cA1045ADUrbanist
//                                         .copyWith(fontSize: 13.sp),
//                                   ),
//                                   UIHelper.horizontalSpace(6.w),
//                                   const CircleAvatar(
//                                     backgroundColor: AppColors.cC6C9CD,
//                                     radius: 2,
//                                   ),
//                                   UIHelper.horizontalSpace(6.w),
//                                   RichText(
//                                       text: TextSpan(children: [
//                                         TextSpan(
//                                             text: "Min order",
//                                             style: TextFontStyle.text12w500c90969DUrbanist
//                                                 .copyWith(fontSize: 13.sp)),
//                                         TextSpan(
//                                             text: " ${snap.minOrderAmount ?? 0} ${snap.currency ?? "N/A"}  ",
//                                             style: TextFontStyle.text12w500c5D636AUrbanist
//                                                 .copyWith(fontSize: 13.sp))
//                                       ])),
//                                   const Spacer(),
//                                   Container(
//                                     padding: EdgeInsets.all(4.sp),
//                                     decoration: ShapeDecoration(
//                                         shape: RoundedRectangleBorder(
//                                           side: const BorderSide(
//                                             color: AppColors.cE1E3E5,
//                                           ),
//                                           borderRadius: BorderRadius.circular(30.r),
//                                         )),
//                                     child: Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           Assets.icons.warningSvgIcon,
//                                           width: 14.w,
//                                           height: 14.h,
//                                         ),
//                                         UIHelper.horizontalSpace(3.w),
//                                         Text(
//                                           "More Info",
//                                           style:
//                                           TextFontStyle.text14w600c757D85Urbanist,
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               UIHelper.verticalSpace(24.h),
//                               SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: [
//                                     OfferCardWidget(
//                                       size: size,
//                                       bgImgPath: Assets.images.offerImg1Bg.path,
//                                       starIconPath: Assets.icons.starOffer1Img.path,
//                                       discountPercentage: '20',
//                                       currency: '300',
//                                       color: AppColors.c640238,
//                                     ),
//                                     UIHelper.horizontalSpace(10.w),
//                                     OfferCardWidget(
//                                       size: size,
//                                       bgImgPath: Assets.images.offerImg2Bg.path,
//                                       starIconPath: Assets.icons.starOffer2Img.path,
//                                       discountPercentage: '20',
//                                       currency: '300',
//                                       color: AppColors.c8D2702,
//                                     ),
//                                   ],
//                                 ),
//                               ),

//                               UIHelper.verticalSpace(20.h),

//                               // I want when I scroll verically full screen , that time everything will be scroll. Like what currently happening. Its okay. But I want when scroll top this TabBar will be dissmissable it will be shown in top part of the screen,and when bottom scroll that time it will be scroll down

//                               // TabBar
//                               SizedBox(
//                                 height: 80.h,
//                                 child: ListView.separated(
//                                     controller: _scrollController,
//                                     scrollDirection: Axis.horizontal,
//                                     itemBuilder: (context, index) {
//                                       return ItemsWidget(
//                                         text: "Pizza",
//                                         currentIndex: index,
//                                         selectedIndex: selectedIndex,
//                                         onTap: () {
//                                           setState(() {
//                                             selectedIndex = index;
//                                           });
//                                           _scrollToItem(index);
//                                         },
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) =>const SizedBox(
//                                       width: 10,
//                                     ),
//                                     itemCount: 9),
//                               ),

//                               UIHelper.verticalSpace(20.h),
//                               const  Divider(
//                                 color: Colors.grey,
//                                 height: 1,
//                                 thickness: 5,
//                               ),
//                               UIHelper.verticalSpace(20.h),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Pizza",
//                                     style: TextFontStyle.text16w800c2D3034Urbanist,
//                                   ),
//                                   UIHelper.horizontalSpace(3.w),
//                                   Image.asset(
//                                     Assets.icons.pizzaIcon.path,
//                                     width: 23.w,
//                                   )
//                                 ],
//                               ),
//                               ListView.separated(
//                                 physics:const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) =>                         FoodItemWidget(
//                                   imgPath: Assets.images.pizzaImg.path,
//                                   title: "Pizza margherita",
//                                   description: "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil",
//                                   rating: "4.8",
//                                   currentPrice: "120",
//                                   previousPrice: "150", onTap: () {  },
//                                 )
//                                 ,
//                                 separatorBuilder: (context, index) =>const SizedBox(height: 10,),
//                                 itemCount: 20,
//                               ),

//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               );

//             }
//             else{
//               return Center(child: Text("Snapshot has error"));
//             }
//           }
//         ),
//       ),
//     );
//   }
// }

// class FoodItemWidget extends StatelessWidget {
//   final VoidCallback onTap;
//   final String imgPath, title, description, rating, currentPrice, previousPrice;

//   const FoodItemWidget({
//     super.key,
//     required this.imgPath,
//     required this.title,
//     required this.description,
//     required this.rating,
//     required this.currentPrice,
//     required this.previousPrice, required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(10.sp),
//         decoration: ShapeDecoration(
//             shape: RoundedRectangleBorder(
//           side: BorderSide(color: AppColors.cE1E3E5),
//           borderRadius: BorderRadius.circular(10.r),
//         )),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               imgPath,
//               width: 92.w,
//               height: 92.h,
//               fit: BoxFit.cover,
//             ),
//             UIHelper.horizontalSpace(15.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title, //"Pizza margherita",
//                         style: TextFontStyle.text20w700cFFFFFFUrbanist
//                             .copyWith(color: Color(0xFF2D3034), fontSize: 14.sp),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(4.sp),
//                         decoration: ShapeDecoration(
//                             color: Color(0xFFFEE9CD),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8.r))),
//                         child: Row(
//                           children: [
//                             SvgPicture.asset(
//                               Assets.icons.starIcon,
//                               width: 12.w,
//                             ),
//                             UIHelper.horizontalSpace(3.w),
//                             Text(
//                               rating,
//                               style: TextFontStyle.text10w600c90969DUrbanist
//                                   .copyWith(color: Colors.black),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   UIHelper.verticalSpace(3.h),
//                   Text(
//                     // "250 gm - Tangy & spicy, a smash of chicken and cheese with mustard oil",
//                     description,
//                     textAlign: TextAlign.start,
//                     style: TextFontStyle.text12w500c5D636AUrbanist
//                         .copyWith(color: Color(0xFF757D85)),
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         Assets.icons.fireIcon.path,
//                         width: 12.w,
//                       ),
//                       UIHelper.horizontalSpace(3.w),
//                       Text(
//                         "Popular",
//                         style: TextFontStyle.text10w600c90969DUrbanist
//                             .copyWith(color: Color(0xFF2D3034), fontSize: 11.sp),
//                       )
//                     ],
//                   ),
//                   UIHelper.verticalSpace(5.h),
//                   Row(
//                     children: [
//                       Text(
//                         "AED $currentPrice",
//                         style: TextFontStyle.text14w600c2D3034Urbanist
//                             .copyWith(color: Color(0xFFA1045A)),
//                       ),
//                       UIHelper.horizontalSpace(5.w),
//                       Text(
//                         "AED $previousPrice",
//                         style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
//                           color: Color(0xFF5D636A),
//                           fontSize: 14.sp,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                       Spacer(),
//                       Image.asset(
//                         Assets.icons.plusIcon.path,
//                         width: 23.w,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemsWidget extends StatelessWidget {
//   final String text;
//   final int currentIndex, selectedIndex;
//   final VoidCallback onTap;

//   const ItemsWidget({
//     super.key,
//     required this.text,
//     required this.currentIndex,
//     required this.selectedIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//             decoration: ShapeDecoration(
//                 color: currentIndex == selectedIndex
//                     ? AppColors.cA1045A
//                     : AppColors.cffffff,
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(
//                     color: AppColors.cE1E3E5,
//                   ),
//                   borderRadius: BorderRadius.circular(30.r),
//                 )),
//             child: Row(
//               children: [
//                 Text(
//                   text,
//                   style: TextFontStyle.text20w700cFFFFFFUrbanist.copyWith(
//                       fontSize: 14.sp,
//                       color: currentIndex == selectedIndex
//                           ? AppColors.cffffff
//                           : Colors.grey),
//                 ),
//                 UIHelper.horizontalSpace(3.w),
//                 if (currentIndex == selectedIndex)
//                   Image.asset(
//                     Assets.icons.fireIcon.path,
//                     width: 16.w,
//                     height: 16.h,
//                   ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class OfferCardWidget extends StatelessWidget {
//   final String bgImgPath, starIconPath, discountPercentage, currency;
//   final Color color;

//   const OfferCardWidget({
//     super.key,
//     required this.size,
//     required this.bgImgPath,
//     required this.starIconPath,
//     required this.discountPercentage,
//     required this.currency,
//     required this.color,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12.r),
//           child: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       bgImgPath,
//                     ),
//                     fit: BoxFit.fill)),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 12.h, left: 12.w, right: 32.w),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Image.asset(
//                         starIconPath,
//                         width: 24,
//                         height: 24.h,
//                       ),
//                       UIHelper.horizontalSpace(10.w),
//                       Text(
//                         "$discountPercentage% off",
//                         style: TextFontStyle.text20w700cFFFFFFUrbanist,
//                       ),
//                       UIHelper.horizontalSpace(15.w),
//                       Text(
//                         "upto $currency AED",
//                         style: TextFontStyle.text12w500cEFEFEFUrbanist,
//                       )
//                     ],
//                   ),
//                 ),
//                 UIHelper.verticalSpace(24.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Container(
//                         width: size.width * 0.68,
//                         decoration: ShapeDecoration(
//                             color: color, shape: RoundedRectangleBorder()),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 6,
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 Assets.icons.cycleWhiteIcon.path,
//                                 width: 18,
//                               ),
//                               UIHelper.horizontalSpace(3.w),
//                               Text(
//                                 "Free delivery",
//                                 style: TextFontStyle.text10w600cFFFFFFUrbanist,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
