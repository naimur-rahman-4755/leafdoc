import 'package:flutter/material.dart';
import '../../../core/theme/text_style.dart';
import 'disease_model.dart';

class DiseaseDetailSheet extends StatelessWidget {
  final Disease disease;

  const DiseaseDetailSheet({
    super.key,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            controller: scrollController,
            children: [
              _Handle(),
              Text(disease.name, style: AppTextStyles.h2),
              _Section(title: 'Overview', content: disease.overview),
              _ImagePreviewRow(imagePath: disease.imagePath),
              _Section(title: 'Causes', content: disease.causes),
              _Section(title: 'Prevention', content: disease.prevention),
              _Section(
                title: 'Treatment & Farmer Actions',
                content: disease.treatment,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Handle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h3),
          const SizedBox(height: 6),
          Text(content, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

class _ImagePreviewRow extends StatelessWidget {
  final String imagePath;

  const _ImagePreviewRow({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 120, fit: BoxFit.cover),
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: 3,
        ),
      ),
    );
  }
}
