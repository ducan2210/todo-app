import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/screens/oneboading/widgets/oneboarding_page_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      body: SafeArea(child: OnboardingPageView()),
    );
  }
}
