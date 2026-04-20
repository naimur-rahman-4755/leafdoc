import 'package:hive/hive.dart';
import 'history_model.dart';

class HistoryModelAdapter extends TypeAdapter<HistoryModel> {
  @override
  final int typeId = 1;

  @override
  HistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };

    return HistoryModel(
      diseaseName: fields[0] as String,
      diagnosisResult: fields[1] as String,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.diseaseName)
      ..writeByte(1)
      ..write(obj.diagnosisResult)
      ..writeByte(2)
      ..write(obj.createdAt);
  }
}
