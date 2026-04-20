import 'package:flutter/material.dart';
import '../../disease_library/screen/disease_item.dart';
import '../../disease_library/screen/disease_model.dart';


class DiseaseLibraryRow extends StatelessWidget {
  final List<Disease> diseases;
  final void Function(Disease disease) onTap;

  const DiseaseLibraryRow({
    super.key,
    required this.diseases,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: diseases.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return GestureDetector(
            onTap: () => onTap(disease),
            child: DiseaseItem(
              name: disease.name,
              imagePath: disease.imagePath,
            ),
          );
        },
      ),
    );
  }
}
