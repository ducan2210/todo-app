import 'package:color_hex/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/screens/category/category_list_screen.dart';
import 'package:todo_app/screens/task_priority/task_priority_list_screen.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskNameTextController = TextEditingController();
  final TextEditingController _taskDescriptionTextController =
      TextEditingController();
  CategoryModel? _selectedCategory;
  DateTime? _selectedDateTime;
  int _priority = 1;

  @override
  void initState() {
    super.initState();
  }

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
          _buildTaskPriorityField(),
          if (_selectedDateTime != null) _buildTaskTimeField(),
          if (_selectedCategory != null) _buildTaskCategoryField(),

          _buildTaskActionField(),
        ],
      ),
    );
  }

  Widget _buildTaskPriorityField() {
    return Container(
      margin: EdgeInsets.only(top: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "doUuTien",
            fontSize: 18.sp,
            color: AppColorConfig.gray,
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.sp),
              border: Border.fromBorderSide(
                BorderSide(
                  color: AppColorConfig.accentColor.withValues(alpha: 0.87),
                  width: 0.5.sp,
                ),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/flag_icon.png',
                  height: 24.sp,
                  width: 24.sp,
                  fit: BoxFit.fill,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
                SizedBox(width: 8.sp),
                CustomTextWidget(text: _priority.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Column(
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
              borderSide: BorderSide(width: 1.sp, color: AppColorConfig.white),
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
    );
  }

  Widget _buildTaskDescriptionField() {
    return Column(
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
              borderSide: BorderSide(width: 1.sp, color: AppColorConfig.white),
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
    );
  }

  Widget _buildTaskActionField() {
    return Container(
      margin: EdgeInsets.only(top: 4.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  _selectTaskTimeField();
                },
                icon: Image.asset(
                  'assets/images/timer_icon.png',
                  height: 24.sp,
                  width: 24.sp,
                  fit: BoxFit.fill,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
              ),
              IconButton(
                onPressed: () {
                  _showDialogChooseCategory();
                },
                icon: Image.asset(
                  'assets/images/tag_icon.png',
                  height: 24.sp,
                  width: 24.sp,
                  fit: BoxFit.fill,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
              ),
              IconButton(
                onPressed: () {
                  _showDialogChoosePriority();
                },
                icon: Image.asset(
                  'assets/images/flag_icon.png',
                  height: 24.sp,
                  width: 24.sp,
                  fit: BoxFit.fill,
                  color: AppColorConfig.white.withValues(alpha: 0.87),
                ),
              ),
            ],
          ),

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

  Widget _buildTaskCategoryField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.sp),
        CustomTextWidget(
          text: "loaiCongViec",
          fontSize: 18.sp,
          color: AppColorConfig.gray,
        ),
        SizedBox(height: 16.h),
        Container(child: _buildCategoryItem(_selectedCategory!)),
      ],
    );
  }

  Widget _buildCategoryItem(CategoryModel category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 64.sp,
          width: 64.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: category.backgroundColorHex?.convertToColor,
          ),
          child: Icon(
            IconData(category.iconCodePoint!, fontFamily: 'MaterialIcons'),

            color: category.iconColorHex?.convertToColor,
            size: 40.sp,
          ),
        ),
        SizedBox(height: 4.sp),
        CustomTextWidget(
          text: category.name,
          fontSize: 14.sp,
          color: AppColorConfig.white,
        ),
      ],
    );
  }

  void _showDialogChooseCategory() async {
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return CategoryListScreen();
      },
    );

    if (result != null && result is Map<String, dynamic>) {
      final categoryId = result['categoryId'];
      if (categoryId == null) {
        return;
      }
      final categoryName = result['name'];
      final categoryBackgroundColorHex = result['backgroundColorHex'];
      final categoryIcon = result['iconCodePoint'];
      final categoryIconColorHex = result['iconColorHex'];
      final categoryModel = CategoryModel(
        id: categoryId,
        name: categoryName,
        backgroundColorHex: categoryBackgroundColorHex,
        iconCodePoint: categoryIcon,
        iconColorHex: categoryIconColorHex,
      );

      setState(() {
        _selectedCategory = categoryModel;
      });
    }
  }

  Widget _buildTaskTimeField() {
    return Container(
      margin: EdgeInsets.only(top: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "thoiGianCongViec",
            fontSize: 18.sp,
            color: AppColorConfig.gray,
          ),
          SizedBox(height: 16.h),
          Container(child: _buildTaskDateTimeField()),
        ],
      ),
    );
  }

  Widget _buildTaskDateTimeField() {
    return CustomTextWidget(
      text: DateFormat('dd/MM/yyyy HH:mm').format(_selectedDateTime!),
    );
  }

  void _selectTaskTimeField() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColorConfig.accentColor,
              onSurface: AppColorConfig.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (!mounted) {
      return;
    }
    if (date == null) {
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColorConfig.accentColor,
              onSurface: AppColorConfig.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (time == null) {
      return;
    }
    final selectedDateTime = date.copyWith(
      day: date.day,
      month: date.month,
      year: date.year,
      hour: time.hour,
      minute: time.minute,
      second: 0,
    );
    setState(() {
      _selectedDateTime = selectedDateTime;
    });
  }

  void _showDialogChoosePriority() async {
    final result = await showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) {
        return TaskPriorityListScreen(priority: _priority);
      },
    );
    if (result != null && result is int) {
      print(result);
      setState(() {
        _priority = result;
      });
    }
  }
}
