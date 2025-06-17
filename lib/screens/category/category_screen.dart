import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  final nameCategoryTextController = TextEditingController();
  final List<Color> dataColor = [];
  Color? colorSelected;
  @override
  void initState() {
    super.initState();
    dataColor.addAll([
      AppColorConfig.category1,
      AppColorConfig.category2,
      AppColorConfig.category3,
      AppColorConfig.category4,
      AppColorConfig.category5,
      AppColorConfig.category6,
      AppColorConfig.category7,
      AppColorConfig.category8,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColorConfig.backgroundColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomTextWidget(
            text: "taoDanhMucMoi",
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBodyScreen(context),
    );
  }

  Widget _buildBodyScreen(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          _buildCategoryNameField(context),
          _buildCategoryChoseIconField(),
          _buildCategoryChoseBackgroundColorField(),
          Spacer(),
          _buildCancelAndCreateOrEditCategoryButton(),
        ],
      ),
    );
  }

  Widget _buildCategoryNameField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("tenDanhMuc"),
          Container(
            margin: EdgeInsets.only(top: 10.sp),
            child: TextFormField(
              controller: nameCategoryTextController,
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
                ).translate("tenDanhMucPlaceholder"),
                hintStyle: TextStyle(
                  color: AppColorConfig.gray,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChoseIconField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("bieuTuongDanhMuc"),
          SizedBox(height: 16.sp),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorConfig.gray.withValues(alpha: 0.21),
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
            ),
            child: CustomTextWidget(
              text: "chonIcon",
              fontSize: 12.sp,
              color: AppColorConfig.white.withValues(alpha: 0.87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChoseBackgroundColorField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("mauDanhMuc"),
          SizedBox(height: 16.sp),
          SizedBox(
            width: double.infinity,
            height: 36.sp,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final color = dataColor.elementAt(index);
                final isSelected = colorSelected == color;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      colorSelected = color;
                    });
                  },
                  child: Container(
                    height: 36.sp,
                    width: 36.sp,
                    margin: EdgeInsets.only(right: 8.sp),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(36.sp),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            color: AppColorConfig.white,
                            size: 20.sp,
                          )
                        : null,
                  ),
                );
              },
              itemCount: dataColor.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return CustomTextWidget(
      text: title,
      fontSize: 16.sp,
      color: AppColorConfig.white.withValues(alpha: 0.87),
    );
  }

  Widget _buildCancelAndCreateOrEditCategoryButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 107.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: CustomTextWidget(
              text: "huy",
              fontSize: 16.sp,
              isUpperCase: true,
              color: AppColorConfig.gray,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorConfig.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
            ),
            child: CustomTextWidget(
              text: "taoDanhMuc",
              isUpperCase: true,
              fontSize: 16.sp,
              color: AppColorConfig.white,
            ),
          ),
        ],
      ),
    );
  }

  void _onHandleCreateCategory() {
    final nameCategory = nameCategoryTextController.text.trim();
  }
}
