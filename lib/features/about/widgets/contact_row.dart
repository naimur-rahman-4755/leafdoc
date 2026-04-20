import 'package:flutter/cupertino.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 12),
        Text(text, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}