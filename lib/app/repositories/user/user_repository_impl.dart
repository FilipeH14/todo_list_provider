import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains(password)) {
          throw AuthException(
            message: 'Email já utilizado por favor escolha outro email',
          );
        } else {
          throw AuthException(
            message:
                'Você se cadastrou pelo google, por favor utilize-o para entrar',
          );
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredencial.user;
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);
      if (e.code == 'wrong-password') {
        AuthException(message: 'Login ou senha inválidos');
      }
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    final loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);

    try {
      if (loginMethods.contains('password')) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(
          message:
              'Cadastro realizado com o google, não pode ser resetado a senha',
        );
      } else {
        throw AuthException(
          message: 'Email não cadastrado',
        );
      }
    } on PlatformException catch (e, s) {
      print(e);
      print(s);
      throw AuthException(message: 'Erro ao resetar senha');
    }
  }
}
