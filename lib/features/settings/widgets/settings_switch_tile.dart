import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';
import 'icon_container.dart';

class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          IconContainer(icon: icon, background: iconBg),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}