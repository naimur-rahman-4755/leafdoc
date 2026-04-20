import 'package:flutter/material.dart';
import '../../../core/theme/text_style.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.camera_alt_outlined, size: 72),
        SizedBox(height: 16),
        Text('No image selected', style: AppTextStyles.h3),
        SizedBox(height: 8),
        Text(
          'Take a photo or choose from gallery to start diagnosis',
          style: AppTextStyles.bodySecondary,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
