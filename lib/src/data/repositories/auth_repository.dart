import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

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

  Future<models.User?> signUp(
      {String? name, required String email, required String password}) async {
    try {
      var result = await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      );
      if (result.status == true) {
        return login(email: email, password: password);
      }
    } catch (error) {
      print(error.toString());
    }
    return null;
  }

  Future<models.User> login(
      {required String email, required String password}) async {
    await account.createEmailSession(
      email: email,
      password: password,
    );
    return account.get();
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

  Future<void> logout() {
    return account.deleteSession(sessionId: 'current');
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
