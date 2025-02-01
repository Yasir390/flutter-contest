// ignore_for_file: unreachable_switch_case

import 'dart:io';
import 'package:flutter/cupertino.dart';
// import 'package:training_app/features/auth/presentation/login/login_screen.dart';
// import 'package:training_app/features/auth/presentation/sign_up/sign_up_screen.dart';
// import 'package:training_app/features/edit_profile/presentation/edit_profile_screen.dart';
// import 'package:training_app/features/finish_session/presentation/finish_session_screen.dart';
// import 'package:training_app/features/guide_book/presentation/guide_book_screen.dart';
// import 'package:training_app/features/guide_book_to_next_screen/presentation/guide_book_to_next_screen.dart';
// import 'package:training_app/features/profile/presentation/profile_screen.dart';
import 'package:training_app/features/restaurant_info_home/presentation/restaurant_info_screen.dart';
import 'package:training_app/features/restaurant_info_home/presentation/item_details_screen.dart';
import 'package:training_app/features/submit_video/presentation/submit_video_screen.dart';
// import 'package:training_app/features/bottom_navigation/presentation/bottom_navigation_screen.dart';
// import 'package:training_app/features/challenge_details/presentation/challenge_details_screen.dart';
// import 'package:training_app/features/leader_board_profile/presentation/leader_board_profile_screen.dart';
// import 'package:training_app/features/onboarding_four/presentation/onboarding_screen_four.dart';
// import 'package:training_app/features/onboarding_three/presentation/onboarding_screen_three.dart';
// import 'package:training_app/features/plan/presentation/plan_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String signIsScreen = '/signIsScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String onboardingScreenThree = '/onboardingScreenThree';
  static const String onboardingScreenFour = '/onboardingScreenFour';
  static const String bottomNavigation = '/bottomNavigation';
  static const String planScreen = '/planScreen';
  static const String challengeDetails = '/challengeDetails';
  static const String leaderBoard = '/leaderBoard';
  static const String videoPlayer = '/videoPlayer';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String guideBook = '/guideBook';
  static const String guideBookToNextScreen = '/guideBookToNextScreen';
  static const String finishSession = '/finishSession';
  static const String submitVideo = '/submitVideo';
  static const String restaurantInfoHomeScreen = '/restaurantInfoHomeScreen';
  static const String itemDetailsScreen = '/itemDetailsScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.restaurantInfoHomeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: RestaurantInfoHomeScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const RestaurantInfoHomeScreen());

      // case Routes.itemDetailsScreen:
      // Map args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget:  ScreenTitle(widget: ItemDetailsScreen(snap: args['snap'],)),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) =>  ItemDetailsScreen(snap: args["snap"],));

      // case Routes.submitVideo:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: SubmitVideoScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const SubmitVideoScreen());
      // case Routes.signIsScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: LoginScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const LoginScreen());
      // case Routes.signUpScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: SignUpScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const SignUpScreen());
      // case Routes.onboardingScreenThree:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: OnboardingScreenThree()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const OnboardingScreenThree());
      // case Routes.onboardingScreenFour:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: OnboardingScreenFour()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const OnboardingScreenFour());

      // // case Routes.bottomNavigation:
      // //   return Platform.isAndroid
      // //       ? _FadedTransitionRoute(
      // //           widget: const ScreenTitle(widget: BottomNavigationScreen()),
      // //           settings: settings)
      // //       : CupertinoPageRoute(
      // //           builder: (context) => const BottomNavigationScreen());

      // case Routes.planScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: PlanScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const PlanScreen());

      // case Routes.challengeDetails:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: ChallengeDetailsScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const ChallengeDetailsScreen());

      // case Routes.leaderBoard:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: LeaderBoardScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const LeaderBoardScreen());

      // case Routes.videoPlayer:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: FullScreenVideoPlayer()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const FullScreenVideoPlayer());

      // case Routes.profile:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: ProfileScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const ProfileScreen());

      // case Routes.editProfile:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: EditProfileScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const EditProfileScreen());

      // case Routes.guideBook:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: GuideBookScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const GuideBookScreen());

      // case Routes.guideBookToNextScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: GuideBookToNextScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const GuideBookToNextScreen());

      // case Routes.finishSession:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: FinishSessionScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const FinishSessionScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
