// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'ScoreModel.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class ScoreModelAdapter extends TypeAdapter<ScoreModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   ScoreModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return ScoreModel(
//       score: fields[0] as int?,
//       timeStamp: fields[1] as int?,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, ScoreModel obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.score)
//       ..writeByte(1)
//       ..write(obj.timeStamp);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ScoreModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
