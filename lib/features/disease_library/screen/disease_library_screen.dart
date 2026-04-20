import 'package:flutter/material.dart';
import '../../../core/theme/color.dart';
import 'disease_card.dart';
import 'disease_data.dart';
import 'disease_details_sheet.dart';
import 'disease_model.dart';

class DiseaseLibraryScreen extends StatelessWidget {
  const DiseaseLibraryScreen({super.key});

  void _openDetails(BuildContext context, Disease disease) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => DiseaseDetailSheet(disease: disease),
    );
  }

  @override
  Widget build(BuildContext context) {
    final diseases = DiseaseData.all
        .map((d) => d.toDisease())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disease Library',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const _SearchField(),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: diseases.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final disease = diseases[index];
                 return DiseaseCard(
                    name: disease.name,
                   imagePath: disease.imagePath,
                    onTap: () => _openDetails(context, disease),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search diseases...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
