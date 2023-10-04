import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivia/models/answer.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart' as model_user;
import 'package:trivia/provider/ranking_provider.dart';

class RankingOnlineProvider extends RankingProvider {
  const RankingOnlineProvider();
  @override
  Future<List<model_user.User>> getAllUsers() async {
    var result = <model_user.User>[];
    var snapshot = await FirebaseFirestore.instance.collection('users').get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      result.add(model_user.User(
          id: doc.id, name: data['name'], email: data['email']));
    }
    return result;
  }

  Future<List<CategoryTrivia>> _getAllCategories() async {
    final categoryDocs =
        await FirebaseFirestore.instance.collection('categories').get();
    final List<CategoryTrivia> categories = [];
    for (var categoryDoc in categoryDocs.docs) {
      final data = categoryDoc.data();
      categories.add(CategoryTrivia(
        id: categoryDoc.id,
        sentence: data['category'],
      ));
    }
    return categories;
  }

  Future<List<Answer>> _getAllAnswers() async {
    final answerDocs =
        await FirebaseFirestore.instance.collection('answers').get();
    final List<Answer> answers = [];
    for (var answerDoc in answerDocs.docs) {
      final data = answerDoc.data();
      answers.add(Answer(
        id: answerDoc.id,
        sentence: data['sentence'],
      ));
    }
    return answers;
  }

  Future<List<Question>> _getAllQuestion(
      List<Answer> answers, List<CategoryTrivia> categories) async {
    final questionDocs =
        await FirebaseFirestore.instance.collection('questions').get();
    final List<Question> questions = [];
    for (var questionDoc in questionDocs.docs) {
      final data = questionDoc.data();
      final questionAnswers = <Answer>[];
      for (var ans in data['answers']) {
        questionAnswers.add(answers.firstWhere((element) => element.id == ans));
      }

      questions.add(Question(
        id: questionDoc.id,
        sentence: data['sentence'],
        answers: questionAnswers,
        rightAnswer: data['rightAnswer'],
        category: categories
            .firstWhere((element) => element.id == data['category'])
            .sentence,
      ));
    }
    return questions;
  }

  @override
  Future<List<Trivia>> getAllTrivias() async {
    var result = <Trivia>[];
    /*final categories = await _getAllCategories();
    final answers = await _getAllAnswers();
    final questions = await _getAllQuestion(answers, categories);
    var snapshot = await FirebaseFirestore.instance.collection('trivias').get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      final questionsTrivia = <Question>[];
      for (var id in data['questions']) {
        var question = questions.firstWhere(
          (element) => element.id == id,
        );
        questionsTrivia.add(question);
      }
      result.add(
        Trivia.fromJson({
          'category': categories
              .firstWhere((element) => element.id == data['category']).toJson(),
          'questions': questionsTrivia.map((e) => e.toJson()).toList(),
          'duration': data['duration'],
          'answers': data['answers'],
          'userId': data['userId'],
        }),
      );
    }*/
    return result;
  }

  @override
  Map<String, List<Trivia>> getAllTriviasByCategory() {
    // TODO: implement getAllTriviasByCategory
    throw UnimplementedError();
  }
}
