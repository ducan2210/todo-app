import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';
import 'package:todo_app/screens/login/login_screen.dart';
import 'package:todo_app/widgets/back_screen_button_widget.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConfig.backgroundColor,
        elevation: 0,
        leading: BackScreenButtonWidget(),
      ),
      backgroundColor: AppColorConfig.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndContent(),
              _buildFormRegister(),
              _buildLoginButton(),
              SizedBox(height: 45.sp),
              _buildOrSplitDivider(),
              SizedBox(height: 45.sp),
              _buildMoreLoginOptions(),
              _buildHaveNotAccountText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndContent() {
    return Container(
      margin: EdgeInsets.only(top: 4.sp, bottom: 53.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          CustomTextWidget(
            text: 'dangKy',
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: AppColorConfig.white.withValues(alpha: 0.87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFormRegister() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'tenNguoiDung',
                fontSize: 16.sp,
                // fontWeight: FontWeight.bold,
                color: AppColorConfig.white.withValues(alpha: 0.87),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.sp),
                child: TextFormField(
                  decoration: InputDecoration(
                    hint: CustomTextWidget(
                      text: "nhapTenNguoiDung",
                      color: AppColorConfig.white.withValues(alpha: 0.67),
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: AppColorConfig.gray),
                    ),
                    fillColor: AppColorConfig.darkerGray.withValues(alpha: 0.3),
                    filled: true,
                  ),
                  style: TextStyle(
                    color: AppColorConfig.white.withValues(alpha: 0.87),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'matKhau',
                fontSize: 16.sp,
                // fontWeight: FontWeight.bold,
                color: AppColorConfig.white.withValues(alpha: 0.87),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.sp),
                child: TextFormField(
                  decoration: InputDecoration(
                    hint: CustomTextWidget(
                      text: "nhapMatKhau",
                      color: AppColorConfig.white.withValues(alpha: 0.67),
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: AppColorConfig.gray),
                    ),
                    fillColor: AppColorConfig.darkerGray.withValues(alpha: 0.3),
                    filled: true,
                  ),
                  style: TextStyle(
                    color: AppColorConfig.white.withValues(alpha: 0.87),
                    fontSize: 16.sp,
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 25.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'xacNhanMatKhau',
                fontSize: 16.sp,
                // fontWeight: FontWeight.bold,
                color: AppColorConfig.white.withValues(alpha: 0.87),
              ),
              Container(
                margin: EdgeInsets.only(top: 8.sp),
                child: TextFormField(
                  decoration: InputDecoration(
                    hint: CustomTextWidget(
                      text: "nhapLaiMatKhau",
                      color: AppColorConfig.white.withValues(alpha: 0.67),
                      fontSize: 16.sp,
                      textAlign: TextAlign.start,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(color: AppColorConfig.gray),
                    ),
                    fillColor: AppColorConfig.darkerGray.withValues(alpha: 0.3),
                    filled: true,
                  ),
                  style: TextStyle(
                    color: AppColorConfig.white.withValues(alpha: 0.87),
                    fontSize: 16.sp,
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: EdgeInsets.only(top: 70.sp),
      height: 48.sp,

      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorConfig.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.sp),
          ),
          disabledBackgroundColor: AppColorConfig.accentColor.withValues(
            alpha: 0.5,
          ),
        ),
        onPressed: null,
        child: CustomTextWidget(
          text: 'dangKy',
          fontSize: 16.sp,
          color: AppColorConfig.white,
        ),
      ),
    );
  }

  Widget _buildOrSplitDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Expanded(
          child: Container(
            color: AppColorConfig.white,
            height: 1.sp,
            width: double.infinity,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.sp),
          child: CustomTextWidget(
            text: 'hoac',
            fontSize: 16.sp,
            color: AppColorConfig.white.withValues(alpha: 0.67),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColorConfig.white,
            height: 1.sp,
            width: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreLoginOptions() {
    return Column(
      children: [
        SizedBox(
          height: 48.sp,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColorConfig.accentColor, width: 1.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google_icon.png",
                  width: 24.sp,
                  height: 24.sp,
                ),
                SizedBox(width: 10.sp),
                CustomTextWidget(
                  text: 'dangKyBangGG',
                  fontSize: 16.sp,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.sp),
        SizedBox(
          height: 48.sp,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColorConfig.accentColor, width: 1.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/apple_icon.png",
                  width: 24.sp,
                  height: 24.sp,
                ),
                SizedBox(width: 10.sp),
                CustomTextWidget(
                  text: 'dangKyBangApple',
                  fontSize: 16.sp,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHaveNotAccountText(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 46.sp),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context).translate("daCoTaiKhoan"),
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColorConfig.white.withValues(alpha: 0.67),
              ),
            ),
            WidgetSpan(child: SizedBox(width: 4.sp)),
            TextSpan(
              text: AppLocalizations.of(context).translate("dangNhap"),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColorConfig.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
