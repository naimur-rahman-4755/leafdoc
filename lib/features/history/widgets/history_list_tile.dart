import 'package:flutter/material.dart';
import '../domain/history_model.dart';

class HistoryListTile extends StatelessWidget {
  final HistoryModel history;

  const HistoryListTile({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.eco_outlined),
        title: Text(history.diseaseName),
        subtitle: Text(history.diagnosisResult),
        trailing: Text(
          '${history.createdAt.day}/${history.createdAt.month}/${history.createdAt.year}',
        ),
      ),
    );
  }
}
