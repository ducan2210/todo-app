import 'package:flutter/material.dart';
import 'package:todo_app/screens/oneboading/widgets/onboarding_child_page.dart';
import 'package:todo_app/utils/enums/onboarding_page_position_enum.dart';

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
      controller: _pageController,
      children: [
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page1,
          nextOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            print("abcs");
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
            print("abcs");
          },
        ),
        OnboardingChildPage(
          onboardingPagePosition: OnboardingPagePosition.page3,
          nextOnPressed: () {
            print("abcs");
          },
          backOnPressed: () {
            _pageController.jumpToPage(1);
          },
          skipOnPressed: () {
            print("abcs");
          },
        ),
      ],
    );
  }
}
