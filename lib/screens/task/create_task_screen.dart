import 'package:flutter/material.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskNameTextController = TextEditingController();
  final TextEditingController _taskDescriptionTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorConfig.darkGray,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.sp).copyWith(top: 25.h),
          child: _buildBodyScreen(),
        ),
      ),
    );
  }

  Widget _buildBodyScreen() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTaskNameField(),
          _buildTaskDescriptionField(),
          _buildTaskActionField(),
        ],
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomTextWidget(
            text: "themCongViec_form_name_label",
            fontSize: 20.sp,
            color: AppColorConfig.white.withValues(alpha: 0.87),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _taskNameTextController,

            style: TextStyle(
              fontSize: 18.sp,
              color: AppColorConfig.white.withValues(alpha: 0.87),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                borderSide: BorderSide(
                  width: 1.sp,
                  color: AppColorConfig.white,
                ),
              ),
              hintText: AppLocalizations.of(
                context,
              ).translate("themCongViec_form_name_place"),
              hintStyle: TextStyle(color: AppColorConfig.gray, fontSize: 16.sp),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTaskDescriptionField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.sp),
          CustomTextWidget(
            text: "themCongViec_form_description_label",
            fontSize: 18.sp,
            color: AppColorConfig.gray,
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _taskDescriptionTextController,
            style: TextStyle(fontSize: 16.sp, color: AppColorConfig.white),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.sp)),
                borderSide: BorderSide(
                  width: 1.sp,
                  color: AppColorConfig.white,
                ),
              ),
              hintText: AppLocalizations.of(
                context,
              ).translate("themCongViec_form_description_place"),
              hintStyle: TextStyle(color: AppColorConfig.gray, fontSize: 16.sp),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTaskActionField() {
    return Container(
      margin: EdgeInsets.only(top: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/timer_icon.png',
                    height: 24.sp,
                    width: 24.sp,
                    fit: BoxFit.fill,
                    color: AppColorConfig.white.withValues(alpha: 0.87),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/tag_icon.png',
                    height: 24.sp,
                    width: 24.sp,
                    fit: BoxFit.fill,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/flag_icon.png',
                    height: 24.sp,
                    width: 24.sp,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/send_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
