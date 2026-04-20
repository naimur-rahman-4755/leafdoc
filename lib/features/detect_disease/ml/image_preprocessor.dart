import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

/// MobileNetV3Large preprocessing
/// Matches: tf.keras.applications.mobilenet_v3.preprocess_input
/// Formula: x = x / 127.5 - 1.0
class ImagePreprocessor {
  static const int inputSize = 224;

  static Float32List preprocess(File file) {
    final bytes = file.readAsBytesSync();
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception('Invalid image');
    }

    final resized = img.copyResize(
      decoded,
      width: inputSize,
      height: inputSize,
      interpolation: img.Interpolation.linear,
    );

    final Float32List input =
    Float32List(1 * inputSize * inputSize * 3);

    int index = 0;
    for (int y = 0; y < inputSize; y++) {
      for (int x = 0; x < inputSize; x++) {
        final pixel = resized.getPixel(x, y);

        // RGB order (IMPORTANT)
        final r = pixel.r.toDouble();
        final g = pixel.g.toDouble();
        final b = pixel.b.toDouble();

        // MobileNetV3 preprocess_input
        input[index++] = (r / 127.5) - 1.0;
        input[index++] = (g / 127.5) - 1.0;
        input[index++] = (b / 127.5) - 1.0;


      }
    }

    return input;
  }
}
