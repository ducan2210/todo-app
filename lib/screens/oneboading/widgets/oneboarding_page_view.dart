import 'package:flutter/material.dart';
import 'package:todo_app/screens/oneboading/widgets/onboarding_child_page.dart';
import 'package:todo_app/screens/welcome/welcome_screen.dart';
import 'package:todo_app/utils/enums/onboarding_page_position_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: [
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page1,
          nextOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            _markOnboardingCompleted();
            _goToWelcomeScreen();
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page2,
          nextOnPressed: () {
            _pageController.jumpToPage(2);
          },
          backOnPressed: () {
            _pageController.jumpToPage(0);
          },
          skipOnPressed: () {
            _markOnboardingCompleted();
            _goToWelcomeScreen();
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page3,
          nextOnPressed: () {
            _markOnboardingCompleted();
            _goToWelcomeScreen();
          },
          backOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            _markOnboardingCompleted();
            _goToWelcomeScreen();
          },
        ),
      ],
    );
  }

  void _goToWelcomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  Future<void> _markOnboardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('kOnboardingCompleted', true);
    } catch (e) {
      print(e);
      return;
    }
  }
}
