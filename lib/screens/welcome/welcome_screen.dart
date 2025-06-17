import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/widgets/back_screen_button_widget.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  final bool isFirstTimeStartApp;
  const WelcomeScreen({super.key, required this.isFirstTimeStartApp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isFirstTimeStartApp
                ? BackScreenButtonWidget()
                : SizedBox(height: 0.sp),
            _buildTitleAndContent(),
            Spacer(),
            _buildLoginButton(),
            _buildCreateAccountButton(),
            // _buildChangeLangButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 58.sp),
          CustomTextWidget(
            text: 'chaoMungDenVoiUpTodo',
            fontSize: 32.sp,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 26.sp),
          CustomTextWidget(
            text: 'dangNhapDeTiepTuc',
            fontSize: 16.sp,
            color: AppColorConfig.white.withValues(alpha: 0.67),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      height: 48.sp,
      width: 327.sp,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorConfig.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        onPressed: () {},
        child: CustomTextWidget(
          text: 'dangNhap',
          fontSize: 16.sp,
          isUpperCase: true,
          color: AppColorConfig.white,
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      margin: EdgeInsets.all(20.sp),
      height: 48.sp,
      width: 327.sp,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColorConfig.accentColor, width: 1.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
        ),
        child: CustomTextWidget(
          text: 'taoTaiKhoan',
          fontSize: 16.sp,
          color: AppColorConfig.white,
          isUpperCase: true,
        ),
      ),
    );
  }

  // Widget _buildChangeLangButton(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.all(20.sp),
  //     height: 48.sp,
  //     width: 327.sp,
  //     child: OutlinedButton(
  //       onPressed: () {
  //         context.read<LanguageBloc>().add(
  //           const ChangeLanguage(locale: Locale('en')),
  //         );
  //       },
  //       child: CustomTextWidget(
  //         text: 'changeLanguage',
  //         fontSize: 16.sp,
  //         color: AppColorConfig.white,
  //         isUpperCase: true,
  //       ),
  //     ),
  //   );
  // }
}
