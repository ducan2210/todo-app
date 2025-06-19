import 'package:color_hex/color_hex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realm/realm.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/entities/category_realm_entity.dart';
import 'package:todo_app/models/category_model.dart';
import 'package:todo_app/screens/category/create_or_edit_category_screen.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<CategoryModel> categoryListDataSource = [];
  bool _isEditMode = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCategoryList();
    });
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
            _buildChooseCategoryTitle(),
            _buildGridCategoryList(),
            _buildCancelAndEditButtonField(),
          ],
        ),
      ),
    );
  }

  Widget _buildChooseCategoryTitle() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10.sp),
          child: CustomTextWidget(
            text: 'chonDanhMuc',
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColorConfig.white.withValues(alpha: 0.87),
          ),
        ),
        Divider(color: AppColorConfig.gray),
      ],
    );
  }

  Widget _buildGridCategoryList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),

      itemBuilder: (context, index) {
        final isLastItem = index == categoryListDataSource.length;
        if (isLastItem) {
          return _buildGridCreateNewItem();
        }
        final category = categoryListDataSource.elementAt(index);
        return _buildGridCategoryItem(category);
      },
      itemCount: categoryListDataSource.length + 1,
    );
  }

  Widget _buildGridCategoryItem(CategoryModel category) {
    return GestureDetector(
      onTap: () {
        _onHandleClickCategoryItem(category);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64.sp,
            width: 64.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: category.backgroundColorHex?.convertToColor,

              border: Border.all(
                color: _isEditMode
                    ? AppColorConfig.category8
                    : Colors.transparent,
                width: _isEditMode ? 5.sp : 0,
              ),
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
      ),
    );
  }

  Widget _buildGridCreateNewItem() {
    return GestureDetector(
      onTap: () {
        _goToCreateOrEditCategoryScreen();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 64.sp,
            width: 64.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: AppColorConfig.category3,
            ),
            child: Icon(
              Icons.add,

              color: AppColorConfig.category4,
              size: 40.sp,
            ),
          ),
          SizedBox(height: 4.sp),
          CustomTextWidget(
            text: "taoMoi",
            fontSize: 14.sp,
            color: AppColorConfig.white,
          ),
        ],
      ),
    );
  }

  // Widget _buildAddCategoryButtonField() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: AppColorConfig.accentColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(4.sp),
  //         ),
  //       ),
  //       child: CustomTextWidget(
  //         text: "themDanhMuc",
  //         fontSize: 16.sp,
  //         color: AppColorConfig.white,
  //       ),
  //       onPressed: () {
  //         // Handle add category button press
  //       },
  //     ),
  //   );
  // }

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
                setState(() {
                  _isEditMode = !_isEditMode;
                });
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
                text: _isEditMode ? "huySua" : "sua",
                fontSize: 16.sp,
                color: AppColorConfig.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCategoryList() async {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);
    final categories = realm.all<CategoryRealmEntity>();
    List<CategoryModel> categoryList = categories.map((e) {
      return CategoryModel(
        id: e.id.toString(),
        name: e.name,
        iconCodePoint: e.iconCodePoint,
        backgroundColorHex: e.backgroundColorHex,
        iconColorHex: e.iconColorHex,
      );
    }).toList();
    setState(() {
      categoryListDataSource = categoryList;
    });
  }

  void _goToCreateOrEditCategoryScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateOrEditCategoryScreen()),
    );

    if (result == true) {
      _getCategoryList();
    }
  }

  void _onHandleClickCategoryItem(CategoryModel category) {
    if (_isEditMode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              CreateOrEditCategoryScreen(categoryId: category.id),
        ),
      );
    } else {
      Navigator.pop(context, {
        "categoryId": category.id,
        "name": category.name,
        "iconCodePoint": category.iconCodePoint,
        "backgroundColorHex": category.backgroundColorHex,
        "iconColorHex": category.iconColorHex,
      });
    }
  }
}
