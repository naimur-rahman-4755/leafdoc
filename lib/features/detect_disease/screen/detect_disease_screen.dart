import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/text_style.dart';
import '../../disease_library/screen/disease_details_sheet.dart';
import '../controller/detect_disease_controller.dart';
import '../widgets/action_buttons.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/image_preview.dart';
import '../widgets/result_card.dart';

class DetectDiseaseScreen extends StatelessWidget {
  const DetectDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetectDiseaseController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detect Disease'),
        ),
        body: Consumer<DetectDiseaseController>(
          builder: (context, controller, _) {
            return _DetectDiseaseBody(controller: controller);
          },
        ),
      ),
    );
  }
}

class _DetectDiseaseBody extends StatelessWidget {
  final DetectDiseaseController controller;

  const _DetectDiseaseBody({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// ─────────────────────────────────────────
        /// MAIN CONTENT (IMAGE + ACTIONS)
        /// ─────────────────────────────────────────
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),

                /// IMAGE PREVIEW / PLACEHOLDER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildTopSection(),
                ),

                const SizedBox(height: 20),

                /// ACTION AREA (NO EXPANDED!)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _buildBottomSection(context),
                ),
              ],
            ),
          ),
        ),

        /// ─────────────────────────────────────────
        /// ANALYZING OVERLAY (SMOOTH + STABLE)
        /// ─────────────────────────────────────────
        AnimatedOpacity(
          opacity:
          controller.state == DetectDiseaseState.analyzing ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 250),
          child: controller.state == DetectDiseaseState.analyzing
              ? const _AnalyzingOverlay()
              : const SizedBox.shrink(),
        ),

        /// ─────────────────────────────────────────
        /// RESULT BOTTOM SHEET (SLIDE UP)
        /// ─────────────────────────────────────────
        _AnimatedResultSheet(controller: controller),
      ],
    );
  }

  Widget _buildTopSection() {
    if (controller.image == null) {
      return const ImagePlaceholder();
    }

    return ImagePreview(
      image: controller.image!,
      onRemove: controller.removeImage,
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    switch (controller.state) {
      case DetectDiseaseState.idle:
        return ActionButtons(
          onCamera: controller.pickFromCamera,
          onGallery: controller.pickFromGallery,
        );

      case DetectDiseaseState.imageSelected:
        return SizedBox(
          width: double.infinity,
          height: 48, // ✅ Professional Material height
          child: FilledButton(
            onPressed: () => controller.analyze(context),
            child: const Text('Detect Disease'),
          ),
        );

      case DetectDiseaseState.analyzing:
      case DetectDiseaseState.result:
        return const SizedBox(height: 48);
    }
  }
}

class _AnalyzingOverlay extends StatelessWidget {
  const _AnalyzingOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.35),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.eco,
                size: 48,
                color: Colors.greenAccent,
              ),
              SizedBox(height: 16),
              Text(
                'Analyzing leaf...',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedResultSheet extends StatelessWidget {
  final DetectDiseaseController controller;

  const _AnimatedResultSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    final show = controller.state == DetectDiseaseState.result;

    return AnimatedSlide(
      offset: show ? Offset.zero : const Offset(0, 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      child: show
          ? _ResultBottomSheet(result: controller.result!)
          : const SizedBox.shrink(),
    );
  }
}

class _ResultBottomSheet extends StatelessWidget {
  final result;

  const _ResultBottomSheet({required this.result});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 12,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        color: Theme.of(context).colorScheme.surface,
        child: SizedBox(
          height: height * 0.45,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                /// Result card
                ResultCard(result: result),

                const SizedBox(height: 20),

                /// View details
                FilledButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => DiseaseDetailSheet(
                        disease: result.disease.toDisease(),
                      ),
                    );
                  },
                  child: const Text('View Full Disease Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}