import 'dart:collection';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'database_repository.dart';
import '../../domain/models/workout_model.dart';

import '../../domain/models/report_model.dart';
import '../datasources/appwrite.dart';

class ReportRepository {
  static const String fitPulseDatabaseId = '6484be018b503003ea70';
  static const String reportDatabaseId = '6489ef56881a0aa918bf';
  Databases databases = Databases(Appwrite.instance.client);
  late ReportModel reportModel;
  late String docId;
  void createNewReport(String docId) async {
    await databases.createDocument(
      databaseId: fitPulseDatabaseId,
      collectionId: reportDatabaseId,
      documentId: ID.unique(),
      data: ReportModel(
              user: docId, cal: 0, exercisesDone: [], noOfWorkouts: 0, time: 0)
          .toJson(),
    );
  }

  Future<ReportModel> fetchReport() async {
    var currUser = await DatabaseRepository().getCurrentUser();

    print('currUser ${currUser.userId}');
    var result = await databases.listDocuments(
      databaseId: fitPulseDatabaseId,
      collectionId: reportDatabaseId,
      queries: [
        Query.equal("user", [currUser.userId])
      ],
    );
    print('result ${result.documents.first.data['user']}');
    reportModel = ReportModel.fromJson(result.documents.first.data);
    docId = result.documents.first.$id;
    print('docId ${docId}');

    return reportModel;
  }

  Future<ReportModel> addDoneExercisse(WorkoutModel workoutModel) async {
    if (!reportModel.exercisesDone.contains(workoutModel.exercise)) {
      List<String>? exerciseDoneTemp = reportModel.exercisesDone;
      exerciseDoneTemp.add(workoutModel.exercise);
      print('herer ${exerciseDoneTemp}');
      var v = reportModel.copyWith(
        cal: reportModel.cal + workoutModel.calories,
        noOfWorkouts: reportModel.noOfWorkouts + 1,
        exercisesDone: exerciseDoneTemp,
        time: reportModel.time + workoutModel.time,
      );
      reportModel = v;
      print('new calo ${v.toJson()}');
      Document result = await databases.updateDocument(
        databaseId: fitPulseDatabaseId,
        collectionId: reportDatabaseId,
        documentId: docId,
        data: v.toJson(),
      );
      return v;
    }
    return reportModel;
  }
}
