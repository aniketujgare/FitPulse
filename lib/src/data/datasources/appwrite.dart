import 'package:appwrite/appwrite.dart';


class Appwrite {
  static final Appwrite instance = Appwrite._internal();

  late final Client client;

  factory Appwrite._() {
    return instance;
  }

  Appwrite._internal() {
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('64690d0eedba385967a1')
        .setSelfSigned(status: true);
  }
}