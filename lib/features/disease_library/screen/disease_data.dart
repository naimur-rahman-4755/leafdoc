import 'package:leafdoc/core/theme/assets.dart';

import 'disease_model.dart';

class DiseaseData {
  final String label; // ML label (EXACT)
  final String name; // Human readable
  final String imagePath;
  final String description;
  final String symptoms;
  final String shortTreatment;
  final String treatment;
  final String prevention;

  const DiseaseData({
    required this.label,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.symptoms,
    required this.shortTreatment,
    required this.treatment,
    required this.prevention,
  });

  // ─────────────────────────────
  // ML LABEL → DISEASE (single gate)
  // ─────────────────────────────
  static DiseaseData fromModelLabel(String label) {
    return _diseaseMap[label] ?? _diseaseMap['healthy']!;
  }

  // ─────────────────────────────
  // Library / UI access
  // ─────────────────────────────
  static List<DiseaseData> get all => _diseaseMap.values.toList();

  // ─────────────────────────────
  // SINGLE SOURCE OF TRUTH
  // ─────────────────────────────
  static final Map<String, DiseaseData> _diseaseMap = {
    'Bacterial_spot': DiseaseData(
      label: 'Bacterial_spot',
      name: 'Bacterial Spot',
      imagePath: AppAssets.bacterialSpot,
      description:
      '• Common bacterial disease affecting leaves, stems, and fruits\n'
          '• Reduces fruit quality and market value',
      symptoms:
      '• Small dark brown to black spots on leaves\n'
          '• Yellow halos around spots\n'
          '• Leaf scorch and premature leaf drop',
      shortTreatment:
      '• Remove and destroy infected plant parts\n'
          '• Apply copper-based bactericide as preventive spray',
      treatment: '• Apply copper-based bactericide at 7–10 day intervals\n'
    '• Remove and destroy infected plant parts\n'
    '• Avoid working in wet fields\n'
    '• Disinfect tools regularly',
      prevention:
      '• Use certified disease-free seed and transplants\n'
          '• Avoid overhead irrigation\n'
          '• Rotate crops with non-solanaceous crops\n'
          'Reference: USDA Extension / PlantVillage',
    ),

    'Early_blight': DiseaseData(
      label: 'Early_blight',
      name: 'Early Blight',
      imagePath: AppAssets.earlyBlight,
      description:
      '• Fungal disease commonly appearing on older leaves\n'
          '• Causes gradual defoliation and yield loss',
      symptoms:
      '• Brown spots with concentric rings on leaves\n'
          '• Yellowing around infected areas\n'
          '• Leaf drying and drop from bottom upward',
      shortTreatment:
      '• Remove heavily infected leaves\n'
          '• Apply recommended protective fungicide',
      treatment:
      '• Apply protective fungicides such as chlorothalonil or mancozeb\n'
          '• Remove infected lower leaves\n'
          '• Improve air circulation between plants\n'
          '• Water at the base of plants only',

      prevention:
      '• Practice crop rotation\n'
          '• Maintain field sanitation\n'
          '• Use mulch to reduce soil splash\n'
          'Reference: FAO / University Extension Services',
    ),

    'Late_blight': DiseaseData(
      label: 'Late_blight',
      name: 'Late Blight',
      imagePath: AppAssets.lateBlight,
      description:
      '• Serious and fast-spreading disease of leaves and fruits\n'
          '• Can destroy entire fields under favorable conditions',
      symptoms:
      '• Large dark, water-soaked lesions on leaves\n'
          '• White fungal growth on leaf underside in humid weather\n'
          '• Brown, firm rot on fruits',
      shortTreatment:
      '• Remove infected plants immediately\n'
          '• Apply recommended systemic fungicide promptly',
      treatment:
      '• Apply systemic fungicide immediately\n'
          '• Remove and destroy infected plants\n'
          '• Avoid overhead irrigation\n'
          '• Monitor field daily during cool, wet weather',
      prevention:
      '• Avoid prolonged leaf wetness\n'
          '• Ensure good field drainage and airflow\n'
          '• Use resistant varieties where available\n'
          'Reference: USDA Extension / FAO',
    ),

    'Leaf_Mold': DiseaseData(
      label: 'Leaf_Mold',
      name: 'Leaf Mold',
      imagePath: AppAssets.leafMold,
      description:
      '• Fungal disease common in humid and protected cultivation\n'
          '• Mainly affects foliage',
      symptoms:
      '• Yellow patches on upper leaf surface\n'
          '• Olive-green to brown mold on leaf underside\n'
          '• Leaf curling and drop in severe cases',
      shortTreatment:
      '• Remove infected leaves\n'
          '• Apply approved fungicide if disease spreads',
      treatment:
      '• Remove affected leaves\n'
          '• Apply approved fungicide\n'
          '• Increase ventilation\n'
          '• Reduce humidity in growing area',

      prevention:
      '• Improve ventilation and reduce humidity\n'
          '• Avoid dense planting\n'
          '• Use resistant varieties\n'
          'Reference: PlantVillage / University Extension',
    ),

    'Septoria_leaf_spot': DiseaseData(
      label: 'Septoria_leaf_spot',
      name: 'Septoria Leaf Spot',
      imagePath: AppAssets.septoriaLeafSpot,
      description:
      '• Fungal leaf disease causing heavy defoliation\n'
          '• Reduces plant vigor and fruit yield',
      symptoms:
      '• Small gray spots with dark margins\n'
          '• Yellowing and dropping of lower leaves\n'
          '• Spots may contain tiny black dots',
      shortTreatment:
      '• Remove infected leaves promptly\n'
          '• Apply protective fungicide at early stage',
      treatment:
      '• Apply protective fungicide early\n'
          '• Remove infected leaves\n'
          '• Avoid overhead watering\n'
          '• Keep soil surface clean',

      prevention:
      '• Practice crop rotation\n'
          '• Keep field clean of plant debris\n'
          '• Avoid overhead irrigation\n'
          'Reference: USDA Extension / PlantVillage',
    ),

    'Spider_mites Two-spotted_spider_mite': DiseaseData(
      label: 'Spider_mites Two-spotted_spider_mite',
      name: 'Two-Spotted Spider Mite',
      imagePath: AppAssets.spiderMites,
      description:
      '• Sap-sucking mite pest affecting tomato leaves\n'
          '• Thrives in hot and dry conditions',
      symptoms:
      '• Fine yellow speckles on leaves\n'
          '• Webbing on leaf underside\n'
          '• Leaf drying and bronzing',
      shortTreatment:
      '• Spray water to reduce mite population\n'
          '• Apply recommended miticide if infestation is high',
      treatment:
      '• Spray strong water jet on leaves\n'
          '• Apply recommended miticide\n'
          '• Remove heavily infested leaves\n'
          '• Increase field humidity',

      prevention:
      '• Maintain adequate field humidity\n'
          '• Monitor plants regularly\n'
          '• Encourage natural predators\n'
          'Reference: FAO / University Extension',
    ),

    'Target_Spot': DiseaseData(
      label: 'Target_Spot',
      name: 'Target Spot',
      imagePath: AppAssets.targetSpot,
      description:
      '• Fungal disease affecting leaves, stems, and fruits\n'
          '• Can cause defoliation and fruit blemishes',
      symptoms:
      '• Brown circular spots with concentric rings\n'
          '• Yellowing around lesions\n'
          '• Premature leaf drop',
      shortTreatment:
      '• Remove infected leaves\n'
          '• Apply recommended fungicide',
      treatment:
      '• Apply recommended fungicide\n'
          '• Remove infected leaves\n'
          '• Improve airflow\n'
          '• Avoid overhead irrigation',

      prevention:
      '• Improve air circulation in field\n'
          '• Avoid overhead irrigation\n'
          '• Rotate crops\n'
          'Reference: PlantVillage / USDA Extension',
    ),

    'Tomato_Yellow_Leaf_Curl_Virus': DiseaseData(
      label: 'Tomato_Yellow_Leaf_Curl_Virus',
      name: 'Yellow Leaf Curl Virus',
      imagePath: AppAssets.yellow,
      description:
      '• Viral disease causing severe growth reduction\n'
          '• Results in major yield loss',
      symptoms:
      '• Upward curling of leaves\n'
          '• Yellowing and stunted growth\n'
          '• Reduced flower and fruit formation',
      shortTreatment:
      '• Remove infected plants immediately\n'
          '• Control insect vectors promptly',
      treatment:
      '• Remove infected plants\n'
          '• Control whiteflies using insecticide\n'
          '• Use reflective mulch\n'
          '• Install insect-proof nets',

      prevention:
      '• Control whiteflies effectively\n'
          '• Use resistant varieties\n'
          '• Install insect-proof nets where possible\n'
          'Reference: FAO / PlantVillage',
    ),

    'Tomato_mosaic_virus': DiseaseData(
      label: 'Tomato_mosaic_virus',
      name: 'Tomato Mosaic Virus',
      imagePath: AppAssets.mosaic,
      description:
      '• Viral disease affecting leaf color and growth\n'
          '• Easily spread through contact',
      symptoms:
      '• Mosaic or mottled light and dark green leaves\n'
          '• Leaf distortion and reduced growth\n'
          '• Poor fruit development',
      shortTreatment:
      '• Remove infected plants\n'
          '• Disinfect tools and hands',
      treatment:
      '• Remove infected plants\n'
          '• Disinfect tools and hands\n'
          '• Avoid handling plants when wet\n'
          '• Control weeds',

      prevention:
      '• Use virus-free seed and seedlings\n'
          '• Avoid handling plants when wet\n'
          '• Practice strict field hygiene\n'
          'Reference: USDA Extension / FAO',
    ),

    'healthy': DiseaseData(
      label: 'healthy',
      name: 'Healthy Leaf',
      imagePath: AppAssets.healthy,
      description:
      '• Leaf shows normal growth and color\n'
          '• No visible disease or pest damage',
      symptoms:
      '• Uniform green color\n'
          '• No spots, curling, or deformities',
      shortTreatment:
      '• No treatment required',
      treatment:
      '• No treatment required\n'
          '• Continue regular monitoring\n'
          '• Maintain proper nutrition\n'
          '• Follow good crop management practices',

      prevention:
      '• Maintain balanced nutrition\n'
          '• Monitor crops regularly\n'
          '• Follow good agricultural practices\n'
          'Reference: FAO / University Extension',
    ),
  };
}
extension DiseaseDataToDisease on DiseaseData {
  Disease toDisease() {
    return Disease(
      id: label,
      name: name,
      imagePath: imagePath,
      overview: description,
      causes: symptoms,
      prevention: prevention,
      treatment: treatment,
    );
  }
}
