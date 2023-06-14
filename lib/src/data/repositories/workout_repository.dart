import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/domain/models/workout_model.dart';

import '../datasources/appwrite.dart';

class WorkoutRepository {
  static const String workoutDatabaseId = '64885e7250b64a6569d9';
  static const String chestCollectionId = '64886940eec3e5d4bd73';
  static const String tricepCollectionId = '6488c3de58e0468c0744';
  static const String bicepCollectionId = '6488ab5882039747d556';
  static const String backCollectionId = '64887ac18b6f7210bce3';
  static const String shoulderCollectionId = '6488c02ca1f098784ec1';
  Databases databases = Databases(Appwrite.instance.client);

  Future<List<WorkoutModel>> fetchChestWorkout() async {
    DocumentList result = await databases.listDocuments(
      databaseId: workoutDatabaseId,
      collectionId: chestCollectionId,
    );
    List<WorkoutModel> chestWorkoutList = [];
    for (int i = 0; i < result.documents.length; i++) {
      chestWorkoutList
          .add(WorkoutModel.fromMap(result.documents.elementAt(i).data));
    }
    return chestWorkoutList;
  }

  Future<List<WorkoutModel>> fetchTricepWorkout() async {
    DocumentList result = await databases.listDocuments(
      databaseId: workoutDatabaseId,
      collectionId: tricepCollectionId,
    );
    List<WorkoutModel> tricepWorkoutList = [];
    for (int i = 0; i < result.documents.length; i++) {
      tricepWorkoutList
          .add(WorkoutModel.fromMap(result.documents.elementAt(i).data));
    }
    return tricepWorkoutList;
  }

  Future<List<WorkoutModel>> fetchbicepWorkout() async {
    DocumentList result = await databases.listDocuments(
      databaseId: workoutDatabaseId,
      collectionId: bicepCollectionId,
    );
    List<WorkoutModel> bicepWorkoutList = [];
    for (int i = 0; i < result.documents.length; i++) {
      bicepWorkoutList
          .add(WorkoutModel.fromMap(result.documents.elementAt(i).data));
    }
    return bicepWorkoutList;
  }

  Future<List<WorkoutModel>> fetchbackWorkout() async {
    DocumentList result = await databases.listDocuments(
      databaseId: workoutDatabaseId,
      collectionId: backCollectionId,
    );
    List<WorkoutModel> backWorkoutList = [];
    for (int i = 0; i < result.documents.length; i++) {
      backWorkoutList
          .add(WorkoutModel.fromMap(result.documents.elementAt(i).data));
    }
    return backWorkoutList;
  }

  Future<List<WorkoutModel>> fetchshoulderWorkout() async {
    DocumentList result = await databases.listDocuments(
      databaseId: workoutDatabaseId,
      collectionId: shoulderCollectionId,
    );
    List<WorkoutModel> shoulderWorkoutList = [];
    for (int i = 0; i < result.documents.length; i++) {
      shoulderWorkoutList
          .add(WorkoutModel.fromMap(result.documents.elementAt(i).data));
    }
    return shoulderWorkoutList;
  }

  Future<List<List<WorkoutModel>>> getAllWorkout() async {
    List<List<WorkoutModel>> workouts = [];
    var cw = await fetchChestWorkout();
    var tw = await fetchTricepWorkout();
    // print(tw);
    var bw = await fetchbicepWorkout();
    var bbw = await fetchbackWorkout();
    var sw = await fetchshoulderWorkout();

    workouts.add(cw);
    workouts.add(tw);
    workouts.add(bw);
    workouts.add(bbw);
    workouts.add(sw);
    // print(workouts.length);
    return workouts;
  }
}
