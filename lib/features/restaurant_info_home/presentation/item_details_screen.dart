import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common_widgets/custom_text_field.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/ui_helpers.dart';


class ItemDetailsScreen extends StatefulWidget {
  // final snap ;
  final String imgUrl, foodName;
  final double foodPrice;
  const ItemDetailsScreen({Key? key, required this.imgUrl, required this.foodName, required this.foodPrice}) : super(key: key);

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int count = 1;
  String foodName ="";
  String foodImage ="";
  String foodDescription ="";
  String currency ="";
  double footPrice =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cffffff,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
           widget.  imgUrl,
              width: double.maxFinite,
              height: 230.h,
              fit: BoxFit.cover,
            ),
            UIHelper.verticalSpace(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodName,
                    style: TextFontStyle.text20w700c000000Urbanist,
                  ),
                  UIHelper.verticalSpace(5.h),
                  Text(
                    "Lorem ipsum dolor sit amet consectetur. Dignissim pulvinar non viverra pellentesque sollicitudin non risus. Proin a placerat nullam scelerisque tortor sit et sed semper.",
                    style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                      color: Color(0xFF757D85),
                    ),
                  ),
                  UIHelper.verticalSpace(15.h),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: ShapeDecoration(
                        color: Color(0xFFFAF2F7),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFFD693B8)),
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add variation",
                              style: TextFontStyle.text16w800c2D3034Urbanist
                                  .copyWith(
                                color: Color(0xFF454A4F),
                              ),
                            ),
                            Text(
                              "*Required",
                              style: TextFontStyle.text20w700c000000Urbanist
                                  .copyWith(
                                color: Color(0xFFA1045A),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(16.h),
                        VariationTileWidget(
                          ratio: "1:1",
                          price: "120",
                          onTap: () {},
                        ),
                        UIHelper.verticalSpace(10.h),
                        VariationTileWidget(
                          ratio: "1:2",
                          price: "240",
                          onTap: () {},
                        ),
                        UIHelper.verticalSpace(10.h),
                        VariationTileWidget(
                          ratio: "1:4",
                          price: "320",
                          onTap: () {},
                        ),
                        UIHelper.verticalSpace(10.h),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(10.h),
                ],
              ),
            ),
            Divider(
              thickness: 5,
              color: Color(0xFFF0F0F0),
            ),
            UIHelper.verticalSpace(7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Special requests ",
                        style: TextFontStyle.text16w800c2D3034Urbanist),
                    TextSpan(
                        text: "(Optional)",
                        style: TextFontStyle.text10w600c90969DUrbanist.copyWith(
                          fontSize: 16.sp,
                          color: Color(0xFF757D85),
                        ))
                  ])),
                  UIHelper.verticalSpace(6.h),
                  Text(
                    "Special requests are subject to the restaurant's approval. Tell us here what you want to share!",
                    style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                      color: Color(0xFF757D85),
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  CustomTextFormField(
                    // controller: descriptionController,

                    hintText: "e.g Hello",
                    maxline: 3,
                    isPrefixIcon: false,
                    enableBorderColor: Color(0xFFC6C9CD),
                    isBorder: true,
                    hintStyle: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                      color: Color(0xFFC6C9CD),
                      fontWeight: FontWeight.w400,
                    ),
                    textInputStyle:
                        TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                      color: Color(0xFFC6C9CD),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  UIHelper.verticalSpace(50.h),
                  //<<----- item count, add, remove ------------->>
                  ItemCountWidget(
                    price: widget.foodPrice,
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
                  UIHelper.verticalSpace(15.h),
                  //<<-------- add to cart button ------------>>
                  AddToCartButton(
                    onTap: () {
                      bottomSheet();
                    },
                  ),
                  UIHelper.verticalSpace(25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true, // Allows the bottom sheet to take more height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7, // Adjust height
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Adjust for keyboard
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child: Image.asset(
                      Assets.images.foodImg.path,
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
                        "Pizza Margherita",
                        style: TextFontStyle.text20w700c000000Urbanist,
                      ),
                      UIHelper.verticalSpace(5.h),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Dignissim pulvinar non viverra pellentesque sollicitudin non risus. Proin a placerat nullam scelerisque tortor sit et sed semper.",
                        style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                          color: Color(0xFF757D85),
                        ),
                      ),
                      UIHelper.verticalSpace(40.h),
                      ItemCountWidget(
                        price: 120,
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
                      AddToCartButton(onTap:() {

                      },),
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

class ItemCountWidget extends StatelessWidget {
  final int  numOfItem;
  final double price;
  final VoidCallback onDeleteTap, onAddTap;

  const ItemCountWidget({
    super.key,
    required this.price,
    required this.numOfItem,
    required this.onDeleteTap,
    required this.onAddTap,
  });

  // final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
          decoration: ShapeDecoration(
              color: Color(0xFFFAF2F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              )),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "AED ${price * numOfItem} ",
                style: TextFontStyle.text20w700cFFFFFFUrbanist.copyWith(
                  color: Color(0xFFA1045A),
                )),
            TextSpan(
                text: "($numOfItem item)",
                style: TextFontStyle.text12w500cEFEFEFUrbanist.copyWith(
                  fontSize: 14.sp,
                  color: Color(0xFF5D636A),
                ))
          ])),
        ),
        Row(
          children: [
            GestureDetector(
                onTap: onDeleteTap,
                child: Image.asset(
                  Assets.icons.deleteIcon.path,
                  width: 34.w,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                "$numOfItem",
                style: TextFontStyle.text20w700c000000Urbanist
                    .copyWith(fontSize: 24.sp),
              ),
            ),
            GestureDetector(
                onTap: onAddTap,
                child: Image.asset(
                  Assets.icons.addIcon.path,
                  width: 34.w,
                )),
          ],
        ),
      ],
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: ShapeDecoration(
            color: Color(0xFFA1045A),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 24.w,
              ),
              Text(
                "Add to cart",
                style: TextFontStyle.text14w700cA1045AUrbanist
                    .copyWith(color: Colors.white),
              ),
              Image.asset(
                Assets.icons.mailIcon.path,
                width: 24.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VariationTileWidget extends StatelessWidget {
  final String ratio, price;
  final VoidCallback onTap;

  const VariationTileWidget({
    super.key,
    required this.ratio,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFF5D636A))),
          ),
        ),
        UIHelper.horizontalSpace(10.w),
        Text(
          ratio,
          style: TextFontStyle.text12w700cA1045ADUrbanist.copyWith(
            color: Color(0xFF5D636A),
            fontSize: 14,
          ),
        ),
        Spacer(),
        Text(
          "AED $price",
          style: TextFontStyle.text12w700cA1045ADUrbanist.copyWith(
            color: Color(0xFF5D636A),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
