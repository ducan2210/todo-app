import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/configs/app_color_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _pages = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
      Container(color: Colors.orange),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConfig.backgroundColor,
      body: _pages.elementAt(_currentPage),
      floatingActionButton: Container(
        width: 64.sp,
        height: 64.sp,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColorConfig.accentColor,
        ),
        child: IconButton(
          icon: Icon(Icons.add, size: 30.sp, color: AppColorConfig.white),
          onPressed: () {
            // Handle the button press
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColorConfig.white,
        selectedItemColor: AppColorConfig.accentColor,
        backgroundColor: AppColorConfig.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (index) {
          if (index == 2) {
            return;
          }
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColorConfig.darkGray,
            icon: Image.asset(
              'assets/images/home_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/home_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
              color: AppColorConfig.accentColor,
            ),
            label: 'Index',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColorConfig.backgroundColor,
            icon: Image.asset(
              'assets/images/calendar_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/calendar_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
              color: AppColorConfig.accentColor,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Container(), label: ""),
          BottomNavigationBarItem(
            backgroundColor: AppColorConfig.backgroundColor,
            icon: Image.asset(
              'assets/images/clock_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/clock_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
              color: AppColorConfig.accentColor,
            ),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColorConfig.backgroundColor,
            icon: Image.asset(
              'assets/images/user_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              'assets/images/user_icon.png',
              height: 24.sp,
              width: 24.sp,
              fit: BoxFit.fill,
              color: AppColorConfig.accentColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
