import 'package:flutter/material.dart';
import '../utils/AppExtensions.dart';

import '../components/constants/AppFonts.dart';
import '../components/constants/AppIcons.dart';
import '../components/constants/TextStyles.dart';
import '../components/coreComponents/ImageView.dart';
import '../components/coreComponents/TextView.dart';
import 'home/HomeView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    onCreate();
  }

  void onCreate(){
    Future.delayed(const Duration(seconds: 3),(){
      context.replaceNavigator(const HomeView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(url: AppIcons.appLogo,size: 100,),
            TextView(text: 'Weather',textStyle: TextStyles.semiBold16White,margin: EdgeInsets.only(top: AppFonts.s10),)
          ],
        ),
      ),
    );
  }
}
