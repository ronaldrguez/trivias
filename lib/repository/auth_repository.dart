import 'package:trivia/models/user.dart';
import 'package:trivia/provider/auth_provider.dart';
import 'package:trivia/provider/online/auth_online_provider.dart';

class AuthRepository {
  final AuthProvider provider;

  const AuthRepository({this.provider = const AuthOnlineProvider()});

  Future<User?> signIn(String email,String password) => provider.signIn(email,password);

  Future<bool> signUp(User user) => provider.signUp(user);

  Future<bool> signOut() => provider.signOut();

  User? keepLogin() => provider.keepLogin();
}