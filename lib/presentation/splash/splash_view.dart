
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/resourcese/assets_manager.dart';
import 'package:flutter_mvvm/presentation/resourcese/color_manager.dart';
import 'package:flutter_mvvm/presentation/resourcese/constants_manager.dart';
import 'package:flutter_mvvm/presentation/resourcese/routs_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;
  _startDelay(){
    _timer = Timer(Duration(seconds: AppConstants.splashDelay), _goNext);
}
  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
  void initState(){
    super.initState();
    _startDelay();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
  @override
  void dispose(){
_timer?.cancel();
super.dispose();
}
}
