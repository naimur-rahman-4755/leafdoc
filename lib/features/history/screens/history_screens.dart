import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/history_controller.dart';
import '../widgets/history_list_tile.dart';

class HistoryScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HistoryController>();

    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: controller.history.isEmpty
          ? const Center(
        child: Text('No history yet.'),
      )
          : ListView.builder(
        itemCount: controller.history.length,
        itemBuilder: (_, i) =>
            HistoryListTile(history: controller.history[i]),
      ),
    );
  }
}
