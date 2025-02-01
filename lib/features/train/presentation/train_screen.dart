// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:training_app/common_widgets/custom_button.dart';
// import 'package:training_app/common_widgets/custom_text_field.dart';
// import 'package:training_app/constants/text_font_style.dart';
// import 'package:training_app/common_widgets/custom_comming_soon_blur.dart';
// import 'package:training_app/gen/assets.gen.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/helpers/all_routes.dart';
// import 'package:training_app/helpers/navigation_service.dart';
// import 'package:training_app/helpers/ui_helpers.dart';

// class TrainScreen extends StatefulWidget {
//   const TrainScreen({super.key});

//   @override
//   State<TrainScreen> createState() => _TrainScreenState();
// }

// class _TrainScreenState extends State<TrainScreen> {
//   TextEditingController searchController = TextEditingController();

//   int controlIndex = 0;
//   int challengesIndex = 0;
//   int partnerTrainingIndex = 0;
//   int soloTrainingIndex = 0;

//   @override
//   void dispose() {
//     searchController.dispose;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.c020202,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                 image: AssetImage(Assets.images.thumbnailBackground1.path),
//                 fit: BoxFit.fill,
//               )),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     UIHelper.verticalSpace(59.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 50.h,
//                           width: 50.w,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50.r),
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage(
//                                 Assets.images.applogo.path,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "TRAIN",
//                           style: TextFontStyle.text10cffffffw600OpenSans
//                               .copyWith(fontSize: 20.sp),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             NavigationService.navigateTo(Routes.profile);
//                           },
//                           child: Container(
//                             width: 46.45.w,
//                             height: 46.45.h,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         Assets.images.profilePicture.path))),
//                           ),
//                         )
//                       ],
//                     ),
//                     UIHelper.verticalSpace(25.h),
//                     RichText(
//                       text: TextSpan(
//                         text:
//                             'Your training environment as a player should be a space for making mistakes, exploring different techniques, adapting to challenges, and evolving not only as a player, but as a person. Here\'s your experimental playground. ',
//                         style: TextFontStyle.headline21w400cF4F4F4StyleOpenSans
//                             .copyWith(fontSize: 13.sp),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Let\'s Train.',
//                             style: TextFontStyle
//                                 .headline20w400cFEDE1CStyleOpenSans
//                                 .copyWith(
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                     UIHelper.verticalSpace(24.h),
//                     CustomTextField(
//                       controller: searchController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       prefixIcon: Icon(
//                         Icons.search,
//                         size: 30.w,
//                         color: AppColors.cA2A2A2,
//                       ),
//                       hintText: "Search",
//                     ),
//                     UIHelper.verticalSpace(12.h)
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   UIHelper.verticalSpace(24.h),
//                   Text(
//                     "IMPROVE YOUR",
//                     style: TextFontStyle.text14cA2A2A2w600OpenSans
//                         .copyWith(fontWeight: FontWeight.w600),
//                   ),
//                   UIHelper.verticalSpace(24.h),
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: 291.h,
//                         child: PageView.builder(
//                             itemCount: 5,
//                             onPageChanged: (value) {
//                               setState(() {
//                                 controlIndex = value;
//                               });
//                             },
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 20.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 376.w,
//                                       height: 204.75.h,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.cffffff,
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 Assets.images.thumbnail66.path),
//                                             fit: BoxFit.fill),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Image.asset(
//                                               Assets.images.overlay.path)
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       "CONTROL",
//                                       style: TextFontStyle
//                                           .text10cffffffw600OpenSans
//                                           .copyWith(fontSize: 14.sp),
//                                     ),
//                                     Text(
//                                       "Build a strong mindset with exercises and insights that strengthen resilience, and confidence, on and off the field.",
//                                       style: TextFontStyle
//                                           .text14cA2A2A2w600OpenSans
//                                           .copyWith(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                       ),
//                       const CustomComingSoonBlur()
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                         child: ListView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 8.w),
//                                 child: Container(
//                                   height: controlIndex == index ? 10.h : 8.h,
//                                   width: controlIndex == index ? 10.w : 8.w,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: controlIndex == index
//                                           ? AppColors.cffffff
//                                           : AppColors.cA2A2A2),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customeButton(
//                           name: "MORE",
//                           onCallBack: () {},
//                           height: 39.h,
//                           minWidth: 109.w,
//                           borderRadius: 0.r,
//                           color: AppColors.c020202,
//                           textStyle: TextFontStyle.text10cffffffw600OpenSans
//                               .copyWith(
//                                   fontSize: 14.sp, fontWeight: FontWeight.w400),
//                           context: context,
//                           borderColor: AppColors.cffffff,
//                           borderWidth: 0.5.w),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Divider(
//                     color: AppColors.c3D3D3D,
//                     thickness: 1.h,
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Text(
//                     "EXPLORE",
//                     style: TextFontStyle.text14cA2A2A2w600OpenSans
//                         .copyWith(fontWeight: FontWeight.w600),
//                   ),
//                   UIHelper.verticalSpace(24.h),
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: 272.h,
//                         child: PageView.builder(
//                             itemCount: 5,
//                             onPageChanged: (value) {
//                               setState(() {
//                                 soloTrainingIndex = value;
//                               });
//                             },
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 20.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 376.w,
//                                       height: 204.75.h,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.cffffff,
//                                         image: DecorationImage(
//                                             image: AssetImage(Assets
//                                                 .images.thumbnail177.path),
//                                             fit: BoxFit.fill),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Image.asset(
//                                               Assets.images.overlay.path)
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       "SOLO TRAINING",
//                                       style: TextFontStyle
//                                           .text10cffffffw600OpenSans
//                                           .copyWith(fontSize: 14.sp),
//                                     ),
//                                     Text(
//                                       "Just you and the ball — build your skills and develop true mastery with every touch.",
//                                       style: TextFontStyle
//                                           .text14cA2A2A2w600OpenSans
//                                           .copyWith(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                       ),
//                       const CustomComingSoonBlur()
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                         child: ListView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 8.w),
//                                 child: Container(
//                                   height:
//                                       soloTrainingIndex == index ? 10.h : 8.h,
//                                   width:
//                                       soloTrainingIndex == index ? 10.w : 8.w,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: soloTrainingIndex == index
//                                           ? AppColors.cffffff
//                                           : AppColors.cA2A2A2),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customeButton(
//                           name: "MORE",
//                           onCallBack: () {},
//                           height: 39.h,
//                           minWidth: 109.w,
//                           borderRadius: 0.r,
//                           color: AppColors.c020202,
//                           textStyle: TextFontStyle.text10cffffffw600OpenSans
//                               .copyWith(
//                                   fontSize: 14.sp, fontWeight: FontWeight.w400),
//                           context: context,
//                           borderColor: AppColors.cffffff,
//                           borderWidth: 0.5.w),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(24.h),
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: 272.h,
//                         child: PageView.builder(
//                             itemCount: 5,
//                             onPageChanged: (value) {
//                               setState(() {
//                                 partnerTrainingIndex = value;
//                               });
//                             },
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 20.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 376.w,
//                                       height: 204.75.h,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.cffffff,
//                                         image: DecorationImage(
//                                             image: AssetImage(Assets
//                                                 .images.thumbnail188.path),
//                                             fit: BoxFit.cover),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Image.asset(
//                                               Assets.images.overlay.path)
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       "PARTNER TRAINING",
//                                       style: TextFontStyle
//                                           .text10cffffffw600OpenSans
//                                           .copyWith(fontSize: 14.sp),
//                                     ),
//                                     Text(
//                                       "Train with a partner to boost intensity, bring out a competitive edge, and keep each other accountable.",
//                                       style: TextFontStyle
//                                           .text14cA2A2A2w600OpenSans
//                                           .copyWith(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                       ),
//                       const CustomComingSoonBlur()
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                         child: ListView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 8.w),
//                                 child: Container(
//                                   height: partnerTrainingIndex == index
//                                       ? 10.h
//                                       : 8.h,
//                                   width: partnerTrainingIndex == index
//                                       ? 10.w
//                                       : 8.w,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: partnerTrainingIndex == index
//                                           ? AppColors.cffffff
//                                           : AppColors.cA2A2A2),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customeButton(
//                           name: "MORE",
//                           onCallBack: () {},
//                           height: 39.h,
//                           minWidth: 109.w,
//                           borderRadius: 0.r,
//                           color: AppColors.c020202,
//                           textStyle: TextFontStyle.text10cffffffw600OpenSans
//                               .copyWith(
//                                   fontSize: 14.sp, fontWeight: FontWeight.w400),
//                           context: context,
//                           borderColor: AppColors.cffffff,
//                           borderWidth: 0.5.w),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(24.h),
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: 272.h,
//                         child: PageView.builder(
//                             itemCount: 5,
//                             onPageChanged: (value) {
//                               setState(() {
//                                 challengesIndex = value;
//                               });
//                             },
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 20.w),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       width: 376.w,
//                                       height: 204.75.h,
//                                       decoration: BoxDecoration(
//                                         color: AppColors.cffffff,
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 Assets.images.thumbnail1999.path),
//                                             fit: BoxFit.fill),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Image.asset(Assets.images.overlay.path)
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                       "CHALLENGES",
//                                       style: TextFontStyle.text10cffffffw600OpenSans
//                                           .copyWith(fontSize: 14.sp),
//                                     ),
//                                     Text(
//                                       "Master your ability on the ball, with footwork with drills designed to improve your control, and confidence.",
//                                       style: TextFontStyle.text14cA2A2A2w600OpenSans
//                                           .copyWith(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                       ),
//                       const CustomComingSoonBlur()
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                         child: ListView.builder(
//                             primary: false,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(right: 8.w),
//                                 child: Container(
//                                   height: challengesIndex == index ? 10.h : 8.h,
//                                   width: challengesIndex == index ? 10.w : 8.w,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: challengesIndex == index
//                                           ? AppColors.cffffff
//                                           : AppColors.cA2A2A2),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       customeButton(
//                           name: "MORE",
//                           onCallBack: () {},
//                           height: 39.h,
//                           minWidth: 109.w,
//                           borderRadius: 0.r,
//                           color: AppColors.c020202,
//                           textStyle: TextFontStyle.text10cffffffw600OpenSans
//                               .copyWith(
//                                   fontSize: 14.sp, fontWeight: FontWeight.w400),
//                           context: context,
//                           borderColor: AppColors.cffffff,
//                           borderWidth: 0.5.w),
//                     ],
//                   ),
//                   UIHelper.verticalSpace(16.h),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
