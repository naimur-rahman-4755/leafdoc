import 'package:go_router/go_router.dart';
import 'package:leafdoc/features/about/screens/about_screens.dart';
import 'package:leafdoc/features/disease_library/screen/disease_details_sheet.dart';
import 'package:leafdoc/features/disease_library/screen/disease_library_screen.dart';
import 'package:leafdoc/features/history/screens/history_screens.dart';

import '../../features/detect_disease/screen/detect_disease_screen.dart';
import '../../features/disease_library/screen/disease_model.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/settings/screen/settings_screen.dart';
import '../../features/splash/screen/splash_screen.dart';
import '../router/app_routes.dart';

// Screens


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.detectDisease,
        name: AppRoutes.detectDisease,
        builder: (context, state) => const DetectDiseaseScreen(),
      ),

      GoRoute(
        path: AppRoutes.diseaseDetail,
        name: AppRoutes.diseaseDetail,
        builder: (context, state) {
          final disease = state.extra as Disease;
          return DiseaseDetailSheet(disease: disease);
        },
      ),


      GoRoute(
        path: AppRoutes.diseaseLibrary,
        name: AppRoutes.diseaseLibrary,
        builder: (context, state) => const DiseaseLibraryScreen(),
      ),


      GoRoute(
        path: AppRoutes.history,
        name: AppRoutes.history,
        builder: (context, state) =>  HistoryScreens(),
      ),

      GoRoute(
        path: AppRoutes.about,
        name: AppRoutes.about,
        builder: (context, state) => const AboutScreens(),
      ),

      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
