import 'package:flutter/material.dart';
import 'package:leafdoc/core/theme/assets.dart';
import 'package:provider/provider.dart';
import 'package:leafdoc/features/home/weather/screen/weather_controller.dart';
import '../../../../core/theme/color.dart';
import '../../../../core/theme/text_style.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WeatherController>();

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: AppColors.secondaryLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: _buildContent(controller),
      ),
    );
  }

  Widget _buildContent(WeatherController controller) {
    if (controller.isLoading) {
      return const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (controller.error != null) {
      return Text(
        controller.error!,
        style: AppTextStyles.error,
      );
    }

    final weather = controller.weather;
    if (weather == null ||
        weather.main == null ||
        weather.weather == null ||
        weather.weather!.isEmpty) {
      return const Text('Weather data unavailable');
    }

    final dayName = (weather.dt != null && weather.timezone != null)
        ? DateFormat('EEEE').format(
      DateTime.fromMillisecondsSinceEpoch(
        (weather.dt! + weather.timezone!) * 1000,
        isUtc: true,
      ),
    )
        : 'Today';

    final temp = weather.main!.temp?.toStringAsFixed(0) ?? '--';
    final condition = weather.weather!.first.description ?? '--';
    final humidity = weather.main!.humidity?.toString() ?? '--';
    final icon = weather.weather!.first.icon;

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            AppAssets.weathericon,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dayName, style: AppTextStyles.caption),
              Text(
                '$temp°C • $condition',
                style: AppTextStyles.h3,
              ),
            ],
          ),
        ),
        Container(
          height: 36,
          width: 1,
          color: Colors.green.withOpacity(0.3),
        ),
        const SizedBox(width: 12),
        Row(
          children: [
            // Temperature mini
            _MiniWeatherInfo(
              icon: Icons.thermostat,
              value: '$temp°',
            ),
            const SizedBox(width: 16),

            // Humidity mini
            _MiniWeatherInfo(
              icon: Icons.water_drop,
              value: '$humidity%',
            ),
          ],
        ),
      ],
    );
  }
}

class _MiniWeatherInfo extends StatelessWidget {
  final IconData icon;
  final String value;

  const _MiniWeatherInfo({
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.primary,
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}
