import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../history/controller/history_controller.dart';
import '../../history/widgets/history_list_tile.dart';

class HistoryHomeSection extends StatelessWidget {
  const HistoryHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HistoryController>();
    final items = controller.history.take(3).toList();

    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'No history yet. Diagnose your leaf to get started.',
        ),
      );
    }

    return Column(
      children: [
        ...items.map((e) => HistoryListTile(history: e)),
      ],
    );
  }
}