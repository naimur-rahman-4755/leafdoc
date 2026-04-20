import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class TeamTile extends StatelessWidget {
  final String name;
  final String role;
  final String? imagePath;

  const TeamTile({
    super.key,
    required this.name,
    required this.role,
    this.imagePath,
  });

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}';
    }
    return name[0];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: AppColors.secondaryLight,
        backgroundImage:
        imagePath != null ? AssetImage(imagePath!) : null,
        child: imagePath == null
            ? Text(
          initials,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        )
            : null,
      ),
      title: Text(name, style: AppTextStyles.bodyLarge),
      subtitle: Text(role, style: AppTextStyles.bodySecondary),
    );
  }
}