import '../../disease_library/screen/disease_data.dart';

class DetectResult {
  final DiseaseData disease;
  final double confidence;
  final String shortTreatment;

  DetectResult({
    required this.disease,
    required this.confidence,
    required this.shortTreatment,
  });
}