// import '../../model/ScoreModel.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class StorageService{
//
//   static late Box<ScoreModel> _scoreBox;
//
//   static Future create() async{
//     await Hive.initFlutter();
//     Hive.registerAdapter<ScoreModel>(ScoreModelAdapter());
//     _scoreBox = await Hive.openBox<ScoreModel>('score');
//     return;
//   }
//
//
//   static addScore({required ScoreModel data}){
//     _scoreBox.add(data);
//   }
//
//   static List<ScoreModel> getScoreList(){
//     return _scoreBox.values.toList();
//   }
//
//
// }