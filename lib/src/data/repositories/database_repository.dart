import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/config/router/app_router.dart';
import 'package:fitpulse/src/data/datasources/appwrite.dart';

import '../../domain/models/user_model.dart';

class DatabaseRepository {
  static const String fitPulseDatabaseId = '6484be018b503003ea70';
  static const String usersCollectionId = '6484be1836fe39cfbd9e';

  Databases databases = Databases(Appwrite.instance.client);
  Storage storage = Storage(Appwrite.instance.client);
  String createDocumnet(UserModel user) {
    Future result = databases.createDocument(
      databaseId: fitPulseDatabaseId,
      collectionId: usersCollectionId,
      documentId: user.userId,
      data: user.toJson(),
    );
    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
    print(user.userId);
    return user.userId;
  }

  // Future<void> getDocument() async {
  //   DocumentList result = await databases.listDocuments(
  //       databaseId: fitPulseDatabaseId,
  //       collectionId: usersCollectionId,
  //       queries: [
  //         Query.equal("email", ["aniketujgare@gmail.com"]),
  //       ]);
  // }

  Future<UserModel> getCurrentUser() async {
    var userr = await authRepository.getUser();
    DocumentList result = await databases.listDocuments(
        databaseId: fitPulseDatabaseId,
        collectionId: usersCollectionId,
        queries: [
          Query.equal("email", [userr.email]),
        ]);
    var json = result.documents.first.data;
    var user = UserModel.fromJson(json);
    return user;
  }

  Future<UserModel> updateUserProfile({required UserModel userModel}) async {
    var currUser = await getCurrentUser();
    DocumentList result = await databases.listDocuments(
      databaseId: fitPulseDatabaseId,
      collectionId: usersCollectionId,
      queries: [
        Query.equal("email", [currUser.email]),
      ],
    );
    var docId = result.documents.first.$id;
    Document res = await databases.updateDocument(
        databaseId: fitPulseDatabaseId,
        collectionId: usersCollectionId,
        documentId: docId,
        data: userModel.toJson());
    var json = res.data;
    var user = UserModel.fromJson(json);
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
