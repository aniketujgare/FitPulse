import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/data/datasources/appwrite.dart';

import '../../domain/models/user_model.dart';

class DatabaseRepository {
  static const String fitPulseDatabaseId = '6484be018b503003ea70';
  static const String usersCollectionId = '6484be1836fe39cfbd9e';

  Databases databases = Databases(Appwrite.instance.client);
  Storage storage = Storage(Appwrite.instance.client);

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
  }

  Future<UserModel> getCurrentUser() async {
    DocumentList result = await databases.listDocuments(
        databaseId: fitPulseDatabaseId,
        collectionId: usersCollectionId,
        queries: [
          Query.equal("email", ["aniketujgare@gmail.com"]),
        ]);
    var json = result.documents.first.data;
    var user = UserModel.fromMap(json);
    return user;
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

  Future<UserModel> uploadProfilePic(String path, UserModel userModel) async {
    File result = await storage.createFile(
      bucketId: '6484f3557588980fdc8b',
      fileId: ID.unique(),
      file: InputFile.fromPath(path: path, filename: ID.unique()),
    );
    // 64874f8ec305c472a1f6
    String url1 =
        'https://cloud.appwrite.io/v1/storage/buckets/6484f3557588980fdc8b/files/';
    String url2 = result.$id;
    String url3 = '/view?project=64690d0eedba385967a1&mode=admin';
    userModel.profilePic = url1 + url2 + url3;
    return updateUserProfile(userModel: userModel);
  }
}
