import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'nav_icon_text.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selectedIndex == 0 ? AppColors.backgroundGreen : AppColors.black,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavIconText(
            icon: Icons.home_outlined,
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          NavIconText(
            icon: Icons.school_outlined,
            label: 'Courses',
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          NavIconText(
            icon: Icons.question_answer_outlined,
            label: 'Practice',
            isSelected: selectedIndex == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }
}
