import 'package:flutter/material.dart';

import '../../../core/theme/text_style.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            title,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Card(
          child: Column(
            children: List.generate(
              children.length,
                  (index) => Column(
                children: [
                  children[index],
                  if (index != children.length - 1)
                    const Divider(height: 1),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}