import 'package:trivia/models/user.dart';
import 'package:trivia/provider/auth_provider.dart';
import 'package:trivia/provider/local/auth_local_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  const AuthRepository({this.provider = const AuthLocalProvider()});

  Future<User?> signIn(String user,String password) => provider.signIn(user,password);

  Future<bool> signUp(User user) => provider.signUp(user);

  Future<bool> signOut() => provider.signOut();

  Future<User?> keepLogin() => provider.keepLogin();
}