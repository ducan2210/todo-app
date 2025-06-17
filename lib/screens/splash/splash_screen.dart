import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/screens/oneboading/onboarding_screen.dart';
import 'package:todo_app/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    if (await _isOnboardingCompleted()) {
      Future.delayed(Duration(seconds: 3), () {
        if (!context.mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const WelcomeScreen(isFirstTimeStartApp: false);
            },
          ),
        );
      });
    } else {
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  Future<bool> _isOnboardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool('kOnboardingCompleted');
      return result ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
    return Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildIconSplash(), _buildTextSplash()],
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      "assets/images/splash_icon.png",
      width: 95.sp,
      height: 80.sp,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      child: Text(
        "UpTodo",
        style: TextStyle(
          color: AppColorConfig.textColor,
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
