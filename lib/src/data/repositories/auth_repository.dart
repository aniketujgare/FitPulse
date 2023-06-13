import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/data/repositories/database_repository.dart';
import 'package:fitpulse/src/domain/models/user_model.dart';
import '../datasources/appwrite.dart';

class AuthRepository {
  final Account account = Account(Appwrite.instance.client);

  Future<bool> checkSession() async {
    try {
      await account.get();
      // already logged it
      return true;
    } on AppwriteException catch (e) {
      print(e);
      return false;
    }
  }

  Future<User> getUser() async {
    final user = await account.get();
    return user;
  }

  Future<User?> signUp(
      {String? name, required String email, required String password}) async {
    try {
      var result = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      if (result.status == true) {
        var user = UserModel(email: email, userId: result.$id);
        DatabaseRepository().createDocumnet(user);
        return login(email: email, password: password);
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<User> login({required String email, required String password}) async {
    await account.createEmailSession(
      email: email,
      password: password,
    );
    return await account.get();
  }
  // Future<models.User> resetPassword(
  //     {required String email, required String password}) async {
  //       await account.createRecovery(email: email, url: url)
  //   await account.createEmailSession(
  //     email: email,
  //     password: password,
  //   );
  //   return account.get();
  // }

  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
      print('logout: success');
    } on AppwriteException catch (e) {
      print('logout: ${e.message!}');
    }
  }

  resetPasswoord() async {
    Future result = account.createRecovery(
      email: 'aniketujgare@gmail.com',
      url: 'https://cloud.appwrite.io',
    );

    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }
}
