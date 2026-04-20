import 'dart:convert';
import 'package:flutter/services.dart';

class ClassLabels {
  final List<String> labels;

  ClassLabels(this.labels);

  static Future<ClassLabels> load(String assetPath) async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final Map<String, dynamic> raw = json.decode(jsonStr);

    // Sort by index value (VERY IMPORTANT)
    final sorted = raw.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return ClassLabels(sorted.map((e) => e.key).toList());
  }
}


