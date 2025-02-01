import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common_widgets/custom_elevated_button.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/ui_helpers.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 52.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.images.splashScreenImage.path,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ///Login Button
            CustomElevatedButton(
              onTap: () {
                NavigationService.navigateTo(Routes.signIsScreen);
              },
              title: 'Login',
              color: AppColors.cfbd518,
              textStyle: TextFontStyle.headline24w600c000000StyleLato,
            ),
            UIHelper.verticalSpace(20.h),

            ///Sign Up Button
            CustomElevatedButton(
              onTap: () {
                NavigationService.navigateTo(Routes.signUpScreen);
              },
              title: 'Sign Up',
              color: AppColors.cffffff,
              textStyle: TextFontStyle.headline24w600c000000StyleLato,
            ),
            UIHelper.verticalSpace(64.h),
          ],
        ),
      ),
    );
  }
}
