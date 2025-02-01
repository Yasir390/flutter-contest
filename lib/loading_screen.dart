import 'package:flutter/material.dart';
import 'package:training_app/constants/app_constants.dart';
import 'package:training_app/features/restaurant_info_home/presentation/restaurant_info_screen.dart';
import 'package:training_app/features/splash/presentation/splash_screen.dart';
import 'package:training_app/features/welcome/presentation/welcome_screen.dart';

import 'helpers/di.dart';
import 'helpers/helper_methods.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    // bool data = appData.read(kKeyIsLoggedIn) ?? false;
    // log("==== $data");
    // if (data) {
    //   String token = appData.read(kKeyAccessToken);
    //   DioSingleton.instance.update(token);
    // getProfileResponseRxObj.getProfile();
    // getAllCategoryResponseRXObj.getAllCategory();
    // getAddsResponseRXObj.getAdds();
    // }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      // return WelcomeScreen();
      // bool data = appData.read(kKeyIsLoggedIn) ?? false;

      // return appData.read(kKeyIsFirstTime)
      //     ? OnboardScreenYoga()
      //     : data
      //         ? YogaNavigationScreen()
      //         : LoginYoga();

      // return data ? BottomNavigationScreen() : LoginScreen();
      return 
            const RestaurantInfoHomeScreen();
          // // : const VideoRecorderrScreen();
          // : const WelcomeScreen();
      // : const FullScreenVideoPlayer();
      // : const BoostVideoScreen();
      // : const VideoPlayerScreen();
    }
  }
}
