import 'package:flutter/material.dart';
import '../../../core/theme/text_style.dart';
import '../model/detect_result.dart';

class ResultCard extends StatelessWidget {
  final DetectResult result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Diagnosis Result', style: AppTextStyles.caption),
            const SizedBox(height: 6),
            Text(result.disease.name, style: AppTextStyles.h2),
            const SizedBox(height: 6),
            Text(
              '${(result.confidence * 100).round()}% Confidence',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: 12),
            Text(result.shortTreatment),
          ],
        ),
      ),
    );
  }
}
