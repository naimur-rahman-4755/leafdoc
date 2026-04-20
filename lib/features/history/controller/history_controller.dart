import 'package:flutter/material.dart';
import '../data/history_local_service.dart';
import '../domain/history_model.dart';

class HistoryController extends ChangeNotifier {
  final HistoryLocalService _service;

  HistoryController(this._service);

  List<HistoryModel> _history = [];

  List<HistoryModel> get history =>
      _history..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  Future<void> loadHistory() async {
    await _service.deleteExpired();
    _history = await _service.getAll();
    notifyListeners();
  }

  Future<void> addHistory({
    required String diseaseName,
    required String diagnosisResult,
  }) async {
    final history = HistoryModel(
      diseaseName: diseaseName,
      diagnosisResult: diagnosisResult,
      createdAt: DateTime.now(),
    );

    await _service.add(history);
    await loadHistory();
  }
}
