import 'package:color_hex/color_hex.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realm/realm.dart';
import 'package:todo_app/configs/app_color_config.dart';
import 'package:todo_app/constants/app_localizations.dart';
import 'package:todo_app/entities/category_realm_entity.dart';
import 'package:todo_app/widgets/custom_text_widget.dart';

class CreateOrEditCategoryScreen extends StatefulWidget {
  final String? categoryId;
  const CreateOrEditCategoryScreen({super.key, this.categoryId});
  @override
  State<CreateOrEditCategoryScreen> createState() =>
      _CreateOrEditCategoryScreenState();
}

class _CreateOrEditCategoryScreenState
    extends State<CreateOrEditCategoryScreen> {
  final _nameCategoryTextController = TextEditingController();
  IconData? _selectedIcon;
  Color _backGroundColorSelected = AppColorConfig.white;
  Color _iconColorSelected = AppColorConfig.category8;
  bool get _isEdit {
    return widget.categoryId != null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_isEdit) {
        _findCategoryById(widget.categoryId!);
      }
    });
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
            text: _isEdit ? "chinhSuaDanhMuc" : "taoDanhMucMoi",
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
          _buildCategoryChoseIconColorField(),
          _buildCategoryPreview(),
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
              controller: _nameCategoryTextController,
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
              onChanged: (value) {
                setState(() {});
              },
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
            onPressed: () {
              _chooseIcon();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorConfig.gray.withValues(alpha: 0.21),
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
            ),
            child: _selectedIcon != null
                ? Icon(_selectedIcon, color: AppColorConfig.white, size: 26.sp)
                : CustomTextWidget(
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
          SizedBox(height: 8.sp),
          GestureDetector(
            onTap: () {
              _chooseColor("background");
            },
            child: Container(
              height: 36.sp,
              width: 36.sp,
              margin: EdgeInsets.only(right: 8.sp),
              decoration: BoxDecoration(
                color: _backGroundColorSelected,
                borderRadius: BorderRadius.circular(36.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChoseIconColorField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("mauIcon"),
          SizedBox(height: 8.sp),
          GestureDetector(
            onTap: () {
              _chooseColor("icon");
            },
            child: Container(
              height: 36.sp,
              width: 36.sp,
              margin: EdgeInsets.only(right: 8.sp),
              decoration: BoxDecoration(
                color: _iconColorSelected,
                borderRadius: BorderRadius.circular(36.sp),
              ),
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
      margin: EdgeInsets.symmetric(horizontal: 24.sp),
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
            onPressed: () {
              _isEdit ? _onHandleEditCategory() : _onHandleCreateCategory();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorConfig.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 12.sp),
            ),
            child: CustomTextWidget(
              text: _isEdit ? "xacNhan" : "taoDanhMuc",
              isUpperCase: true,
              fontSize: 16.sp,
              color: AppColorConfig.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPreview() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.sp).copyWith(top: 20.sp),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldTitle("xemTruoc"),
          SizedBox(height: 8.sp),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 64.sp,
                width: 64.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: _backGroundColorSelected,
                ),
                child: Icon(
                  _selectedIcon,
                  color: _iconColorSelected,
                  size: 40.sp,
                ),
              ),
              CustomTextWidget(
                text: _nameCategoryTextController.text,
                fontSize: 14.sp,
                color: AppColorConfig.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _chooseIcon() async {
    IconPickerIcon? pickedIcon = await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        iconPackModes: [IconPack.material],
      ),
    );

    if (pickedIcon != null) {
      setState(() {
        _selectedIcon = pickedIcon.data;
      });
    }
  }

  void _chooseColor(String typeName) async {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = typeName == "background"
            ? _backGroundColorSelected
            : _iconColorSelected;
        bool isWheelActive = false;
        return AlertDialog(
          title: CustomTextWidget(
            text: "chonMau",
            fontSize: 16.sp,
            isUpperCase: true,
            fontWeight: FontWeight.bold,
            color: AppColorConfig.backgroundColor,
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              color: tempColor,
              onColorChanged: (Color color) {
                if (!isWheelActive) {
                  setState(() {
                    if (typeName == "background") {
                      _backGroundColorSelected = color;
                    } else {
                      _iconColorSelected = color;
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              onColorChangeStart: (Color color) {
                isWheelActive = true;
              },
              onColorChangeEnd: (Color color) {
                setState(() {
                  if (typeName == "background") {
                    _backGroundColorSelected = color;
                  } else {
                    _iconColorSelected = color;
                  }
                });
                Navigator.of(context).pop();
              },
              width: 25.sp,
              height: 25.sp,
              borderRadius: 5.sp,
              spacing: 5.sp,
              runSpacing: 5.sp,
              wheelDiameter: 200.sp,
              showMaterialName: false,
              showColorName: true,
              enableShadesSelection: false,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.primary: true,
                ColorPickerType.accent: true,
                ColorPickerType.wheel: true,
              },
            ),
          ),
        );
      },
    );
  }

  void _onHandleCreateCategory() async {
    final nameCategory = _nameCategoryTextController.text.trim();
    if (nameCategory.isEmpty) {
      _showAlert("loi", "phaiDatTen");
      return;
    }
    if (_selectedIcon == null) {
      _showAlert("loi", "phaiChonIcon");
      return;
    }
    var config = Configuration.local([CategoryRealmEntity.schema]);
    var realm = Realm(config);

    final backgroundColorHex = _backGroundColorSelected.convertToHex.hex;
    final iconColorSelected = _iconColorSelected.convertToHex.hex;
    var category = CategoryRealmEntity(
      ObjectId(),
      nameCategory,
      iconCodePoint: _selectedIcon?.codePoint,
      backgroundColorHex: backgroundColorHex,
      iconColorHex: iconColorSelected,
    );
    await realm.writeAsync(() {
      realm.add(category);
    });
    await _showAlert("thanhCong", "taoDanhMucThanhCong");

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  Future<void> _showAlert(String title, String message) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomTextWidget(
            text: title,
            fontSize: 16.sp,
            isUpperCase: true,
            fontWeight: FontWeight.bold,
            color: AppColorConfig.backgroundColor,
            textAlign: TextAlign.left,
          ),
          content: CustomTextWidget(
            text: message,
            fontSize: 14.sp,
            color: AppColorConfig.backgroundColor.withValues(alpha: 0.4),
            textAlign: TextAlign.left,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: CustomTextWidget(
                text: "dong",
                fontSize: 16.sp,
                color: AppColorConfig.primaryColor,
                isUpperCase: true,
              ),
            ),
          ],
        );
      },
    );
  }

  void _findCategoryById(String id) {
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);
    final category = realm.find<CategoryRealmEntity>(
      ObjectId.fromHexString(id),
    );
    if (category == null) {
      return;
    }
    _nameCategoryTextController.text = category.name;
    if (category.iconCodePoint != null) {
      _selectedIcon = IconData(
        category.iconCodePoint!,
        fontFamily: 'MaterialIcons',
      );
    }
    if (category.backgroundColorHex != null) {
      _backGroundColorSelected = category.backgroundColorHex!.convertToColor;
    }
    if (category.iconColorHex != null) {
      _iconColorSelected = category.iconColorHex!.convertToColor;
    }
    setState(() {});
  }

  void _onHandleEditCategory() async {
    final nameCategory = _nameCategoryTextController.text.trim();
    if (nameCategory.isEmpty) {
      _showAlert("loi", "phaiDatTen");
      return;
    }
    if (_selectedIcon == null) {
      _showAlert("loi", "phaiChonIcon");
      return;
    }
    final config = Configuration.local([CategoryRealmEntity.schema]);
    final realm = Realm(config);
    final category = realm.find<CategoryRealmEntity>(
      ObjectId.fromHexString(widget.categoryId!),
    );
    if (category == null) {
      return;
    }

    await realm.writeAsync(() {
      category.name = nameCategory;
      category.iconCodePoint = _selectedIcon?.codePoint;
      category.backgroundColorHex = _backGroundColorSelected.convertToHex.hex;
      category.iconColorHex = _iconColorSelected.convertToHex.hex;
    });

    _nameCategoryTextController.text = "";
    _selectedIcon = null;
    _backGroundColorSelected = AppColorConfig.white;
    _iconColorSelected = AppColorConfig.backgroundColor;
    await _showAlert("thanhCong", "suaDanhMucThanhCong");
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
