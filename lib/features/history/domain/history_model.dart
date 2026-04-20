import 'package:hive_flutter/hive_flutter.dart';


@HiveType(typeId: 1)
class HistoryModel extends HiveObject {
  @HiveField(0)
  final String diseaseName;

  @HiveField(1)
  final String diagnosisResult;

  @HiveField(2)
  final DateTime createdAt;

  HistoryModel({
    required this.diseaseName,
    required this.diagnosisResult,
    required this.createdAt,
  });
}
