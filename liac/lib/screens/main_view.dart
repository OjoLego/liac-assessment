import 'package:flutter/material.dart';
import 'package:liac/screens/courses_view.dart';
import 'package:liac/screens/home_view.dart';
import 'package:liac/screens/practice_view.dart';

import '../widgets/bottom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    CoursesView(),
    PracticeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
