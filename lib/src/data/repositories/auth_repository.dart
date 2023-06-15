import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fitpulse/src/config/router/app_router.dart';
import 'package:fitpulse/src/data/repositories/database_repository.dart';
import 'package:fitpulse/src/data/repositories/report_repository.dart';
import 'package:fitpulse/src/domain/models/user_model.dart';
import 'package:fitpulse/src/presentation/blocs/database_bloc/database_bloc.dart';
import 'package:fitpulse/src/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:fitpulse/src/presentation/blocs/workout_bloc/workout_bloc.dart';
import 'package:restart_app/restart_app.dart';
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
        var user = UserModel(
          email: email,
          userId: result.$id,
          age: 20,
          gender: 'Gender',
          height: 165,
          name: 'User',
          phone: 9990000999,
          profilePic:
              'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1331&q=80',
          weight: 65,
        );
        var userId = DatabaseRepository().createDocumnet(user);
        ReportRepository().createNewReport(userId);
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
      await account.deleteSessions();
      print('logout: success');
      Restart.restartApp(webOrigin: '/');
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
