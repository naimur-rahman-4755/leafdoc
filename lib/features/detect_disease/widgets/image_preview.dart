import 'dart:io';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final File image;
  final VoidCallback onRemove;

  const ImagePreview({
    super.key,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ✅ Display the image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            image,
            height: 260,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // ✅ Remove button
        Positioned(
          top: 12,
          right: 12,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: onRemove,
          ),
        ),
      ],
    );
  }
}
