import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../history/controller/history_controller.dart';
import '../ml/tomato_disease_interface.dart';
import '../model/detect_result.dart';
import '../../disease_library/screen/disease_data.dart';

enum DetectDiseaseState {
  idle,
  imageSelected,
  analyzing,
  result,
}

class DetectDiseaseController extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  DetectDiseaseState _state = DetectDiseaseState.idle;
  File? _image;
  DetectResult? _result;
  String? _error;

  DetectDiseaseState get state => _state;
  File? get image => _image;
  DetectResult? get result => _result;
  String? get error => _error;

  static const Duration _minAnalyzeDuration = Duration(milliseconds: 1200);

  // ─────────────────────────────
  // CAMERA
  // ─────────────────────────────
  Future<void> pickFromCamera() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (picked == null) return;

      _image = File(picked.path);
      _state = DetectDiseaseState.imageSelected;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to open camera';
      notifyListeners();
    }
  }

  // ─────────────────────────────
  // GALLERY
  // ─────────────────────────────
  Future<void> pickFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (picked == null) return;

      _image = File(picked.path);
      _state = DetectDiseaseState.imageSelected;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to open gallery';
      notifyListeners();
    }
  }

  // ─────────────────────────────
  // REMOVE IMAGE
  // ─────────────────────────────
  void removeImage() {
    _image = null;
    _result = null;
    _error = null;
    _state = DetectDiseaseState.idle;
    notifyListeners();
  }

  // ─────────────────────────────
  // PLACEHOLDER ANALYZE (unchanged)
  // ─────────────────────────────
  Future<void> analyze(BuildContext context) async {
    if (_image == null) return;

    _error = null;
    _state = DetectDiseaseState.analyzing;
    notifyListeners();

    final analyzeStart = DateTime.now();

    try {
      // Run ML immediately (do NOT wait artificially)
      final ml = await TomatoDiseaseInference.getInstance();
      final prediction = await ml.predict(_image!);

      final disease = DiseaseData.fromModelLabel(prediction.label);

      final result = DetectResult(
        disease: disease,
        confidence: prediction.confidence,
        shortTreatment: disease.shortTreatment,
      );

      // Ensure analyzing is visible long enough
      final elapsed = DateTime.now().difference(analyzeStart);
      final remaining = _minAnalyzeDuration - elapsed;

      if (remaining.inMilliseconds > 0) {
        await Future.delayed(remaining);
      }

      _result = result;

      // ✅ HISTORY SAVE (ONLY ON SUCCESS)
      Provider.of<HistoryController>(context, listen: false).addHistory(
        diseaseName: disease.name,
        diagnosisResult:
        '${disease.name} (${(prediction.confidence * 100).toStringAsFixed(1)}%)',
      );

      _state = DetectDiseaseState.result;
      notifyListeners();
    } catch (e, stack) {
      debugPrint('Analyze error: $e');
      debugPrint('$stack');

      _error =
      'This image does not appear to be a clear tomato leaf.\nPlease try another photo.';

      // 🔒 IMPORTANT: stay in imageSelected (never idle)
      _state = DetectDiseaseState.imageSelected;
      notifyListeners();
    }
  }
}