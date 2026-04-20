import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class StepIconItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const StepIconItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
