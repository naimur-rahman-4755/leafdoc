import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onCamera;
  final VoidCallback onGallery;

  const ActionButtons({
    super.key,
    required this.onCamera,
    required this.onGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onCamera,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Camera'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onGallery,
            icon: const Icon(Icons.photo),
            label: const Text('Gallery'),
          ),
        ),
      ],
    );
  }
}
