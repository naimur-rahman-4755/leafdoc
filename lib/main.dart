import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'features/history/controller/history_controller.dart';
import 'features/history/data/history_local_service.dart';
import 'features/history/domain/history_model.dart';
import 'features/history/domain/history_model_adapter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ Init Hive
  await Hive.initFlutter();

  // 2️⃣ Register adapters BEFORE opening boxes
  Hive.registerAdapter(HistoryModelAdapter());

  // 3️⃣ Open box ONCE
  final historyBox = await Hive.openBox<HistoryModel>('history_box');

  // 4️⃣ Inject dependencies
  final historyService = HistoryLocalService(historyBox);
  final historyController = HistoryController(historyService);

  // 5️⃣ Load persisted data
  await historyController.loadHistory();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HistoryController>.value(
          value: historyController,
        ),
      ],
      child: const App(),
    ),
  );
}
