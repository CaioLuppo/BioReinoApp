import 'dart:convert';

import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/controller/screens/splash_screen/route_animation.dart';
import 'package:bioreino_mobile/view/screens/connection_error_screen/connection_error_screen.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StudentDAO {
  static Map<String, dynamic>? student;
  static const String studentKey = "student";

  static Future<LoginState> login(
    GlobalKey<FormState> formKey,
    String email,
    String password,
  ) async {
    bool isLogged = false;
    dynamic catchedError;

    await Database.studentsCollection?.findOne({"email": email}).then(
      (queryStudent) {
        isLogged = _checkPassword(password, queryStudent?["password"]);
        if (isLogged) {
          student = queryStudent;
          _storeStudentPrefs();
        }
      },
    ).catchError(
      (error, stackTrace) {
        isLogged = false;
        catchedError = error;
      },
    );

    if (catchedError != null && catchedError.runtimeType == TypeError) {
      return LoginState.error;
    } else if (!isLogged) {
      return LoginState.wrongCredentials;
    } else {
      return LoginState.logged;
    }
  }

  static bool _checkPassword(String password, String hashedPassword) {
    return DBCrypt().checkpw(
      password,
      hashedPassword,
    );
  }

  static Future<void> _storeStudentPrefs() async {
    if (StudentDAO.student != null) {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      Map<String, dynamic> convertedMap = StudentDAO.student!.map(
        (key, value) {
          if (key == "subscriptionDate") {
            value as DateTime;
            return MapEntry(key, value.millisecondsSinceEpoch);
          }
          return MapEntry(key, value);
        },
      );

      preferences.setString(
        StudentDAO.studentKey,
        jsonEncode(convertedMap),
      );
    }
  }

  static Future<void> logout(BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 1));
    preferences.clear();
    student = null;
    await DefaultCacheManager().emptyCache();
  }
}

enum LoginState { logged, wrongCredentials, error }
