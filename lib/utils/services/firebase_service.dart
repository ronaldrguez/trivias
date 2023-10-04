import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:trivia/firebase_options.dart';
import 'package:trivia/models/category_trivia.dart';

class FirebaseService {

  static Future<FirebaseApp> init() async {
    var app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    return app;
  }

  Future<List<CategoryTrivia>> getAllCategories() async {
    List<CategoryTrivia> categories = [];
    var response = await FirebaseFirestore.instance.collection('categories').get();
    for (var doc in response.docs) {
      categories.add(CategoryTrivia.fromJson({'id': doc.id, ...doc.data()}));
    }
    return categories;
  }
}