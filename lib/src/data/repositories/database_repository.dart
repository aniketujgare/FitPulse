import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/data/datasources/appwrite.dart';

import '../../domain/models/user_model.dart';

class DatabaseRepository {
  static const String fitPulseDatabaseId = '6484be018b503003ea70';
  static const String usersCollectionId = '6484be1836fe39cfbd9e';

  Databases databases = Databases(Appwrite.instance.client);

  void createDocumnet(UserModel user) {
    Future result = databases.createDocument(
      databaseId: fitPulseDatabaseId,
      collectionId: usersCollectionId,
      documentId: user.userId,
      data: user.toMap(),
    );
    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
    print(user.userId);
  }

  Future<void> getDocument() async {
    DocumentList result = await databases.listDocuments(
        databaseId: fitPulseDatabaseId,
        collectionId: usersCollectionId,
        queries: [
          Query.equal("email", ["aniketujgare@gmail.com"]),
        ]);
    print(result.documents.length);
    // result.then((response) {
    //   print(response.toString());
    // }).catchError((error) {
    //   print(error.response.toString());
    // });
  }

  Future<UserModel> getCurrentUser() async {
    DocumentList result = await databases.listDocuments(
        databaseId: fitPulseDatabaseId,
        collectionId: usersCollectionId,
        queries: [
          Query.equal("email", ["aniketujgare@gmail.com"]),
        ]);
    // print(result.documents.length);
    var json = result.documents.first.data;
    // print(json);
    var user = UserModel.fromMap(json);
    return user;
    // result.then((response) {
    //   print(response.toString());
    // }).catchError((error) {
    //   print(error.response.toString());
    // });
  }

  Future<UserModel> updateUserProfile({required UserModel userModel}) async {
    Document result = await databases.updateDocument(
      databaseId: fitPulseDatabaseId,
      collectionId: usersCollectionId,
      documentId: '6486d0346d4013f1a61f',
      data: userModel.toMap(),
    );
    var json = result.data;
    var user = UserModel.fromMap(json);
    return user;
  }
}
