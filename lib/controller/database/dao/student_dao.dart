import 'dart:convert';
import 'package:crypto/crypto.dart' show sha256;
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bioreino_mobile/controller/database/mongodb.dart';

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
        try {
          isLogged = _checkPassword(password, queryStudent?["password"]);
        } on TypeError {
          throw WrongCredentialsException();
        }
        if (isLogged) {
          student = queryStudent;
          _storeStudentPrefs();
        } else {
          throw WrongCredentialsException();
        }
      },
    ).catchError(
      (error, stackTrace) {
        isLogged = false;
        catchedError = error;
      },
    );

    if (catchedError is WrongCredentialsException) {
      return LoginState.wrongCredentials;
    } else if (catchedError != null) {
      return LoginState.error;
    } else {
      return LoginState.logged;
    }
  }

  static bool _checkPassword(String password, String hashedPassword) {
    return sha256.convert(password.codeUnits).toString() == hashedPassword;
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

class WrongCredentialsException implements Exception {}

enum LoginState { logged, wrongCredentials, error }
