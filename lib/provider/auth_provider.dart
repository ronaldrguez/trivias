import 'package:trivia/models/user.dart';

abstract class AuthProvider {
  const AuthProvider();

  Future<User?> signIn (String email, String password);

  Future<bool> signUp (User user);

  Future<bool> signOut();

  User? keepLogin();
}