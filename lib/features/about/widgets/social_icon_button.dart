import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/color.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
  });

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launch,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}