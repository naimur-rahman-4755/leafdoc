import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafdoc/features/home/widgets/step_icon_item.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Diagnose your plant', style: AppTextStyles.h3),
            const SizedBox(height: 18),

            // Steps row (refined & compact)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  StepIconItem(
                    icon: Icons.document_scanner_outlined,
                    label: 'Capture',
                  ),
                  _StepArrow(),
                  StepIconItem(
                    icon: Icons.analytics_outlined,
                    label: 'Diagnose',
                  ),
                  _StepArrow(),
                  StepIconItem(
                    icon: Icons.healing_outlined,
                    label: 'Treat',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed(AppRoutes.detectDisease);
                },
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Take a Picture'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _StepArrow extends StatelessWidget {
  const _StepArrow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14,
        color: Colors.grey,
      ),
    );
  }
}
