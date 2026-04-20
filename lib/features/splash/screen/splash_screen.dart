import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leafdoc/core/theme/assets.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate initialization (model load, config, etc.)
    Timer(const Duration(seconds: 2), () {

       context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Logo container
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Image.asset(
                    AppAssets.logo,
                    width: 48,
                    height: 48,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // App name
              Text(
                'LeafDoc',
                style: AppTextStyles.h1.copyWith(
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 8),

              // Tagline
              Text(
                'AI-powered plant disease diagnosis',
                style: AppTextStyles.bodySecondary,
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 4),

              // Loading indicator
              SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accent,
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
