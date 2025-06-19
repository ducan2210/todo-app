import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class TaskPriorityListScreen extends StatefulWidget {
  final int priority;
  const TaskPriorityListScreen({super.key, required this.priority});

  @override
  State<TaskPriorityListScreen> createState() => _TaskPriorityListScreenState();
}

class _TaskPriorityListScreenState extends State<TaskPriorityListScreen> {
  late int _selectedPriority;
  @override
  void initState() {
    super.initState();
    _selectedPriority = widget.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBodyScreen(),
    );
  }

  Widget _buildBodyScreen() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sp),
          color: AppColorConfig.darkGray,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildChoosePriorityTitle(),
            _buildGridPriorityList(),
            _buildCancelAndEditButtonField(),
          ],
        ),
      ),
    );
  }

  Widget _buildChoosePriorityTitle() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10.sp),
          child: CustomTextWidget(
            text: 'chinhSuaUuTienCongViec',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColorConfig.white.withValues(alpha: 0.87),
          ),
        ),
        Divider(color: AppColorConfig.gray),
      ],
    );
  }

  Widget _buildGridPriorityList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return _buildGridPriorityButton(index);
      },
      itemCount: 10,
    );
  }

  Widget _buildGridPriorityButton(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPriority = index + 1;
        });
      },
      child: Container(
        margin: EdgeInsets.all(4.sp),
        height: 64.sp,
        width: 64.sp,
        decoration: BoxDecoration(
          color: _selectedPriority == index + 1
              ? AppColorConfig.accentColor
              : AppColorConfig.categoryBackgroundColor,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flag_icon.png',
              fit: BoxFit.fill,
              width: 24.sp,
              height: 24.sp,
            ),
            SizedBox(height: 4.sp),
            CustomTextWidget(
              text: '${index + 1}',
              fontSize: 16.sp,
              color: AppColorConfig.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelAndEditButtonField() {
    return Container(
      margin: EdgeInsets.only(top: 107.sp),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomTextWidget(
                text: "huy",
                fontSize: 16.sp,
                color: AppColorConfig.gray,
              ),
            ),
          ),
          // SizedBox(width: 10.sp),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                if (context.mounted) {
                  Navigator.pop(context, _selectedPriority);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColorConfig.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.sp,
                  vertical: 12.sp,
                ),
              ),
              child: CustomTextWidget(
                text: "luu",
                fontSize: 16.sp,
                color: AppColorConfig.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
