import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:appwrite/models.dart';

import '../datasources/appwrite.dart';

class AuthRepository {
  final Account account = Account(Appwrite.instance.client);

  Future<bool> checkSession() async {
    try {
      await account.get();
      // already logged it
      return true;
    } on AppwriteException catch (e) {
      return false;
    }
  }

  Future<User> getUser() async {
    final user = await account.get();
    return user;
  }

  Future<models.User> signUp(
      {String? name, required String email, required String password}) async {
    await account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: name,
    );
    return login(email: email, password: password);
  }

  Future<models.User> login(
      {required String email, required String password}) async {
    await account.createEmailSession(
      email: email,
      password: password,
    );
    return account.get();
  }

  Future<void> logout() {
    return account.deleteSession(sessionId: 'current');
  }
}
