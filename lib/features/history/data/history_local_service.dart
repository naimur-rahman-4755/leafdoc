import 'package:hive_flutter/hive_flutter.dart';
import '../domain/history_model.dart';

// class HistoryLocalService {
//   static const _boxName = 'history_box';
//
//   Future<Box<HistoryModel>> _openBox() async {
//     return Hive.openBox<HistoryModel>(_boxName);
//   }
//
//   Future<List<HistoryModel>> getAll() async {
//     final box = await _openBox();
//     return box.values.toList();
//   }
//
//   Future<void> add(HistoryModel history) async {
//     final box = await _openBox();
//     await box.add(history);
//   }
//
//   Future<void> deleteExpired() async {
//     final box = await _openBox();
//     final now = DateTime.now();
//
//     for (final item in box.values) {
//       if (now.difference(item.createdAt).inDays > 30) {
//         await item.delete();
//       }
//     }
//   }
// }

class HistoryLocalService {
  final Box<HistoryModel> _box;

  HistoryLocalService(this._box);

  Future<List<HistoryModel>> getAll() async {
    return _box.values.toList();
  }

  Future<void> add(HistoryModel history) async {
    await _box.add(history);
  }

  Future<void> deleteExpired({int maxDays = 30}) async {
    final now = DateTime.now();

    final keysToDelete = _box.keys.where((key) {
      final item = _box.get(key);
      if (item == null) return false;
      return now.difference(item.createdAt).inDays > maxDays;
    }).toList();

    await _box.deleteAll(keysToDelete);
  }
}

