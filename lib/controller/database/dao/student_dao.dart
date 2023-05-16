import 'package:bioreino_mobile/controller/database/mongodb.dart';
import 'package:bioreino_mobile/model/student.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';

abstract class StudentDAO {
  static Student? student;

  static Future<LoginState> login(
    GlobalKey<FormState> formKey,
    String email,
    String password,
  ) async {
    bool isLogged = false;
    Error? catchedError;

    if (formKey.currentState!.validate()) {
      await Database.studentsCollection
          ?.findOne({"email": email})
          .then(
            (aluno) => isLogged = _checkPassword(password, aluno?["password"]),
          )
          .catchError(
            (error, stackTrace) {
              isLogged = false;
              catchedError = error;
              return true;
            },
          );
    }

    if (catchedError != null && catchedError.runtimeType == TypeError) {
      return LoginState.error;
    } else if (!isLogged) {
      return LoginState.wrongCredentials;
    } else {
      return LoginState.logged;
    }

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setBool("logged", true);
  }

  static bool _checkPassword(String password, String hashedPassword) {
    return DBCrypt().checkpw(
      password,
      hashedPassword,
    );
  }
}

enum LoginState { logged, wrongCredentials, error }
