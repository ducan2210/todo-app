import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/utils/enums/onboarding_page_position_enum.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  final VoidCallback nextOnPressed;
  final VoidCallback? backOnPressed;
  final VoidCallback skipOnPressed;
  const OnboardingChildPage({
    super.key,
    required this.onboardingPagePosition,
    required this.nextOnPressed,
    this.backOnPressed,
    required this.skipOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSkipButton(),
              _buildOnboardingImage(),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleAndContent(),
              _buildOnboardingNextAndPrevButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: EdgeInsets.only(top: 14.sp),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: skipOnPressed,
        child: Text(
          "SKIP",
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColorConfig.gray,
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return Center(
      child: Image.asset(
        onboardingPagePosition.onboardingPageImage(),
        height: 246.sp,
        width: 251.sp,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4.sp,
            width: 26.sp,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page1
                  ? AppColorConfig.lightGray
                  : AppColorConfig.gray,
              borderRadius: BorderRadius.circular(56.sp),
            ),
          ),
          SizedBox(width: 8.sp),
          Container(
            height: 4.sp,
            width: 26.sp,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page2
                  ? AppColorConfig.lightGray
                  : AppColorConfig.gray,
              borderRadius: BorderRadius.circular(56.sp),
            ),
          ),
          SizedBox(width: 8.sp),
          Container(
            height: 4.sp,
            width: 26.sp,
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page3
                  ? AppColorConfig.lightGray
                  : AppColorConfig.gray,
              borderRadius: BorderRadius.circular(56.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        children: [
          Text(
            onboardingPagePosition.onboardingPageTitle(),
            style: TextStyle(
              fontSize: 32.sp,
              color: AppColorConfig.white.withValues(alpha: 0.87),
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 42.sp),
          Text(
            onboardingPagePosition.onboardingPageContent(),
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColorConfig.white.withValues(alpha: 0.87),
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndPrevButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 107.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              backOnPressed?.call();
            },
            child: Text(
              "BACK",
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColorConfig.gray,
                fontFamily: 'Lato',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              nextOnPressed.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorConfig.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
            ),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? "GET STARTED"
                  : "NEXT",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Lato',
                color: AppColorConfig.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
