import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class NavIconText extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavIconText({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.chipActive;
    final fg = AppColors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: fg),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(label, style: TextStyle(color: fg)),
            ],
          ],
        ),
      ),
    );
  }
}
