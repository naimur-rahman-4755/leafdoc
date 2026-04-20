import 'package:flutter/material.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class SectionCard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget child;

  const SectionCard({
    super.key,
    this.title,
    this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.primary.withOpacity(0.08),
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Row(
                children: [
                  if (icon != null)
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                  if (icon != null) const SizedBox(width: 12),
                  Text(title!, style: AppTextStyles.h3),
                ],
              ),
              const SizedBox(height: 14),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
