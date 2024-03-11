// import '../../model/ScoreModel.dart';
// import '../../services/storage/StorageService.dart';
//
// abstract class ScoreRepo{
//   Future<void> addScore({required ScoreModel score});
//   Future<List<ScoreModel>> getScores();
// }
//
// class ScoreRepoImplementation extends ScoreRepo{
//
//   @override
//   Future<void> addScore({required ScoreModel score}) async{
//     StorageService.addScore(data: score);
//     return;
//   }
//
//   @override
//   Future<List<ScoreModel>> getScores() async{
//     return StorageService.getScoreList();
//   }
// }