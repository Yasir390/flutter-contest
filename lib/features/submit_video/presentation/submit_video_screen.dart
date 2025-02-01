import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common_widgets/custom_button.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/ui_helpers.dart';

class SubmitVideoScreen extends StatefulWidget {
  const SubmitVideoScreen({super.key});

  @override
  State<SubmitVideoScreen> createState() => _SubmitVideoScreenState();
}

class _SubmitVideoScreenState extends State<SubmitVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c020202,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.submitvideobackground.path),
                fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                UIHelper.verticalSpace(80.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.goBack;
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left,
                          color: AppColors.cffffff,
                          size: 30.sp,
                        ),
                        Text(
                          "Back",
                          style: TextFontStyle.text14cffffffw400OpenSans
                              .copyWith(fontSize: 17.sp),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(60.h),
                RichText(
                  text: TextSpan(
                      text: "VIDEO ",
                      style: TextFontStyle.headlinew700cffffffStyleOpenSans,
                      children: [
                        TextSpan(
                          text: "SUBMITTED",
                          style:
                              TextFontStyle.headline25w700cFEDE1CStyleOpenSans,
                        )
                      ]),
                ),
                UIHelper.verticalSpace(180.h),
                Text(
                  "THANK YOU!",
                  style: TextFontStyle.headlinew700cffffffStyleOpenSans
                      .copyWith(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(50.h),
                Text(
                  "Your video has been successfully uploaded. Our team will review your submission, and your score will be updated on the leaderboard shortly.",
                  style: TextFontStyle.headline24w400c000000StyleOpenSans
                      .copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(30.h),
                Text(
                  "Keep training hard, and we’ll see you at the top!",
                  style: TextFontStyle.headline24w400c000000StyleOpenSans
                      .copyWith(fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpace(120.h),
                customeButton(
                    name: "HOME",
                    onCallBack: () {
                      NavigationService.navigateTo(Routes.bottomNavigation);
                    },
                    height: 54.h,
                    minWidth: 310.w,
                    borderRadius: 0,
                    color: AppColors.cfede1c,
                    textStyle: TextFontStyle.headline24w600c000000StyleOpenSans
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    context: context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
