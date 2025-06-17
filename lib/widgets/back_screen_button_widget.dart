import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackScreenButtonWidget extends StatelessWidget {
  const BackScreenButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        "assets/images/arrow_left_icon.png",
        height: 24.sp,
        width: 24.sp,
        color: AppColorConfig.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
