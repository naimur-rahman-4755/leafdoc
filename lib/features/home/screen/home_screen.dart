import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/router/app_routes.dart';
import '../../../core/theme/assets.dart';
import '../../disease_library/screen/disease_data.dart';
import '../../disease_library/screen/disease_details_sheet.dart';
import '../../disease_library/screen/disease_model.dart';
import '../weather/data/weather_service.dart';
import '../weather/domain/location_services.dart';
import '../weather/screen/weather_card.dart';
import '../weather/screen/weather_controller.dart';
import '../widgets/action_card.dart';
import '../widgets/disease_library.dart';
import '../widgets/history_home_section.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openDiseaseDetails(BuildContext context, Disease disease) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => DiseaseDetailSheet(disease: disease),
    );
  }

  void _openDiseaseLibrary(BuildContext context) {
    context.pushNamed(AppRoutes.diseaseLibrary);
  }

  @override
  Widget build(BuildContext context) {
    final previewDiseases =
    DiseaseData.all.take(5).map((d) => d.toDisease()).toList();


    return Scaffold(
      appBar: AppBar(
        title: const Text('LeafDoc', style: TextStyle(fontWeight: FontWeight.w600)),
        leadingWidth: 56,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              AppAssets.logo,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _onMenuSelected(context, value),
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'detect', child: Text('Detect Disease')),
              PopupMenuItem(value: 'library', child: Text('Disease Library')),
              PopupMenuItem(value: 'history', child: Text('History')),
              PopupMenuItem(value: 'about', child: Text('About Us')),
              PopupMenuItem(value: 'settings', child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeNotifierProvider(
              create: (_) => WeatherController(WeatherService(), LocationService())..loadWeather(),
              child: const WeatherCard(),
            ),
            const SizedBox(height: 20),
            const ActionCard(),
            const SizedBox(height: 28),
            SectionHeader(
              title: 'Disease Library',
              onSeeAll: () => _openDiseaseLibrary(context),
            ),
            const SizedBox(height: 12),
            DiseaseLibraryRow(
              diseases: previewDiseases,
              onTap: (disease) => _openDiseaseDetails(context, disease),
            ),
            const SizedBox(height: 28),
             SectionHeader(
              title: 'Recent History',
              onSeeAll: () => context.pushNamed(AppRoutes.history),
            ),
            const SizedBox(height: 12),
            const HistoryHomeSection(),
          ],
        ),
      ),
    );
  }
  void _onMenuSelected(BuildContext context, String value) {
    switch (value) {
      case 'detect':
        context.pushNamed(AppRoutes.detectDisease);
        break;
      case 'library':
        context.pushNamed(AppRoutes.diseaseLibrary);
        break;
      case 'history':
        context.pushNamed(AppRoutes.history);
        break;
      case 'about':
        context.pushNamed(AppRoutes.about);
        break;
      case 'settings':
        context.pushNamed(AppRoutes.settings);
        break;
    }
  }

}
