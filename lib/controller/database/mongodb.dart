import 'dart:developer';

import 'package:bioreino_mobile/controller/database/credentials.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class Database {
  static Db? db;
  static DbCollection? userCollection;

  static Future<bool> connect() async {
    bool isUserConnected = await isConnected();
    if (isUserConnected == false) {
      return false;
    } else if (db == null || !db!.isConnected) {
      return await _tryConnection();
    }
    return true;
  }

  static Future<bool> _tryConnection() async {
    try {
      db = await Db.create(mongoUrl);
      if (db != null) {
        await db!.open();
        inspect(db);
        userCollection = db!.collection(collectionName);
      }
      return true;
    } on MongoDartError {
      return false;
    } on Exception {
      return false;
    }
  }
}

Future<bool> isConnected() async {
  final bool deviceIsConnected =
      await InternetConnectionChecker().hasConnection;
  if (!deviceIsConnected) return false;
  return true;
}