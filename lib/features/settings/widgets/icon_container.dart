import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color background;

  const IconContainer({
    super.key,
    required this.icon,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: AppColors.primary,
        size: 22,
      ),
    );
  }
}