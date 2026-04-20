import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'class_labels.dart';
import 'image_preprocessor.dart';
import 'package:leafdoc/core/theme/assets.dart';

class TomatoDiseaseInference {
  static const double minConfidence = 0.50;

  static TomatoDiseaseInference? _instance;
  late final Interpreter _interpreter;
  late final ClassLabels _labels;

  TomatoDiseaseInference._();

  static Future<TomatoDiseaseInference> getInstance() async {
    if (_instance != null) return _instance!;

    final instance = TomatoDiseaseInference._();

    instance._interpreter = await Interpreter.fromAsset(
      AppAssets.modelPath,

      options: InterpreterOptions()..threads = 4,
    );


    instance._labels = await ClassLabels.load(AppAssets.labelsPath);

    final inputShape = instance._interpreter.getInputTensor(0).shape;
    final outputShape = instance._interpreter.getOutputTensor(0).shape;

    if (inputShape.toString() != '[1, 224, 224, 3]') {
      throw Exception('Invalid model input shape: $inputShape');
    }

    if (outputShape[1] != instance._labels.labels.length) {
      throw Exception('Model output does not match label count');
    }

    _instance = instance;
    return instance;
  }

  Future<PredictionResult> predict(File image) async {
    final input = ImagePreprocessor.preprocess(image)
        .reshape([1, 224, 224, 3]);

    final output =
    Float32List(_labels.labels.length).reshape([1, _labels.labels.length]);

    _interpreter.run(input, output);

    final probs = output[0];

    double sum = 0.0;
    for (final v in probs) {
      if (!v.isFinite) {
        throw Exception('Invalid model output');
      }
      sum += v;
    }

    // Softmax sanity check
    if ((sum - 1.0).abs() > 0.05) {
      throw Exception('Model output is not softmax');
    }

    int bestIndex = 0;
    double bestProb = probs[0];

    for (int i = 1; i < probs.length; i++) {
      if (probs[i] > bestProb) {
        bestProb = probs[i];
        bestIndex = i;
      }
    }

    if (bestProb < minConfidence) {
      throw Exception('Low confidence prediction');
    }

    return PredictionResult(
      label: _labels.labels[bestIndex],
      confidence: bestProb,
    );
  }

  void dispose() {
    _interpreter.close();
  }
}

class PredictionResult {
  final String label;
  final double confidence;

  PredictionResult({
    required this.label,
    required this.confidence,
  });
}
