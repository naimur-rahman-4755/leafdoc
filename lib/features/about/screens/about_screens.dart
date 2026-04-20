// about_screens.dart

import 'package:flutter/material.dart';

import '../../../core/theme/assets.dart';
import '../../../core/theme/color.dart';
import '../../../core/theme/text_style.dart';
import '../widgets/contact_row.dart';
import '../widgets/section_card.dart';
import '../widgets/social_icon_button.dart';
import '../widgets/team_tile.dart';

class AboutScreens extends StatelessWidget {
  const AboutScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _AppIdentitySection(),
            SizedBox(height: 24),
            SectionCard(
              title: 'Our Mission',
              icon: Icons.flag_outlined,
              child: Text(
                'To empower farmers and agricultural researchers with accessible, accurate, and instant plant disease diagnosis using advanced AI technology. We aim to reduce crop loss and improve food security globally.',
                style: AppTextStyles.bodyMedium,
              ),
            ),

            SectionCard(
              title: 'Our Vision',
              icon: Icons.visibility_outlined,
              child: Text(
                'To transform agriculture through artificial intelligence and build a future free from preventable crop loss.',
                style: AppTextStyles.bodyMedium,
              ),
            ),
            SizedBox(height: 28),
            SectionHeader(title: 'Our Team'),
            SizedBox(height: 12),
            SectionCard(
              child: Column(
                children: [
                  TeamTile(
                    name: 'Md Naimur Rahman',
                    role: 'Lead Researcher',
                    imagePath: AppAssets.naim,
                  ),
                  Divider(),
                  TeamTile(
                    name: 'Meherun Nesha',
                    role: 'AI Engineer',
                    imagePath: AppAssets.meherun,
                  ),
                  Divider(),
                  TeamTile(
                    name: 'Mrh Sabbir Rahman',
                    role: 'AI Engineer',
                    imagePath: AppAssets.sabbir,
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            SectionHeader(title: 'Contact Us'),
            SizedBox(height: 12),
            _ContactCard(),
          ],
        ),
      ),
    );
  }
}


class _AppIdentitySection extends StatelessWidget {
  const _AppIdentitySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: AppColors.secondaryLight,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            AppAssets.logo1,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'LeafDoc',
          style: AppTextStyles.h2,
        ),
        const SizedBox(height: 6),
        const Text(
          'AI-powered plant disease diagnosis',
          style: AppTextStyles.bodySecondary,
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.h3);
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const ContactRow(
              icon: Icons.email_outlined,
              text: 'contact@leafdoc.com',
            ),
            const SizedBox(height: 14),
            const ContactRow(
              icon: Icons.phone_outlined,
              text: '+880 1608 134755',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialIconButton(
                  icon: Icons.facebook,
                  url: 'https://www.facebook.com/draculanaim',
                ),
                SizedBox(width: 16),
                SocialIconButton(
                  icon: Icons.alternate_email,
                  url: 'https://twitter.com',
                ),
                SizedBox(width: 16),
                SocialIconButton(
                  icon: Icons.business,
                  url: 'https://linkedin.com',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

