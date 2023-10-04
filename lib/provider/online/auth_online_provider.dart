import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/models/user.dart' as user_model;
import 'package:trivia/provider/auth_provider.dart';

class AuthOnlineProvider extends AuthProvider {

  const AuthOnlineProvider();

  @override
  user_model.User? keepLogin() {
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
      return user_model.User(id: currentUser.uid, name: currentUser.displayName ?? '', email: currentUser.email ?? '',);
    }
    return null;
  }

  @override
  Future<user_model.User?> signIn(String email, String password) async {
    var credential = EmailAuthProvider.credential(email: email, password: password);
    try {
      var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user != null) {
        return user_model.User(id: userCredential.user!.uid, name: userCredential.user!.displayName ?? 'Not set', email: email,);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        log('The password provided is wrong.');
        throw Exception('he password provided is wrong.');
      } else if (e.code == 'user-not-found') {
        log('The email provided is not found.');
        throw Exception('The email provided is not found.');
      } else if (e.code == 'account-exists-with-different-credential') {
        log('The account already exists with different credential.');
        throw Exception('The account already exists with different credential.');
      } else if(e.code == 'invalid-credential') {
        log('The credential provided is wrong.');
        throw Exception('The credential provided is wrong.');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('An error has been happened');
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }

  @override
  Future<bool> signUp(user_model.User user,) async {
    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(user.name);
      FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      "email": credential.user!.email,
      "name": user.name,
      });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        throw Exception('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      log(e.toString());
      throw Exception('An error has been happened');
    }
  }

}