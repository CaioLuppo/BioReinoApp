import 'package:bioreino_mobile/controller/database/private/credentials.dart';
import 'package:bioreino_mobile/controller/screens/route_animation.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class Database {
  static Db? db;
  static DbCollection? coursesCollection;
  static DbCollection? studentsCollection;
  static DbCollection? categoriesCollection;
  static DbCollection? lessonsCollection;
  static bool connecting = false;

  static Future<bool> connect() async {
    _cleanCollections();
    bool isUserConnected = await isConnected();
    if (!isUserConnected) {
      connecting = false;
      return false;
    } else {
      bool connected = await _tryConnection();
      if (connected) {
        connecting = false;
        return true;
      } else {
        connecting = false;
        return false;
      }
    }
  }

  static Future<void> connectOrError(BuildContext context) async {
    while (connecting) {}
    if (!Database.db!.isConnected) {
      await connect().then(
        (connected) {
          if (!connected) {
            changeScreen(context, const ConnectionErrorScreen());
          }
        },
      );
    }
  }

  static void _cleanCollections() {
    coursesCollection = null;
    studentsCollection = null;
    categoriesCollection = null;
  }

  static Future<bool> _tryConnection() async {
    try {
      connecting = true;
      db = await Db.create(mongoUrl);
      if (db != null) {
        await db!.open();
        studentsCollection = db!.collection(studentsCollectionName);
        coursesCollection = db!.collection(coursesCollectionName);
        categoriesCollection = db!.collection(categoriesCollectionName);
        lessonsCollection = db!.collection(lessonsCollectionName);
      }
      return true;
    } on MongoDartError {
      return false;
    } on Exception {
      return false;
    } on Error {
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
