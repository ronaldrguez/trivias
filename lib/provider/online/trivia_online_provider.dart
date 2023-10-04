import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/models/answer.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/provider/trivia_provider.dart';
class TriviaOnlineProvider extends TriviaProvider{
  const TriviaOnlineProvider();

  @override
  Future<Trivia> getTrivia(CategoryTrivia category) async {
    final answerDocs = await FirebaseFirestore.instance.collection('answers').get();
    final List<Answer> answers = [];
    for (var answerDoc in answerDocs.docs) {
      final data = answerDoc.data();
      answers.add(Answer(
        id: answerDoc.id,
        sentence: data['sentence'],
      ));
    }
    final questionDocs = await FirebaseFirestore.instance.collection('questions').where('category', isEqualTo: category.id,).get();
    final List<Question> questions = [];
    for (var questionDoc in questionDocs.docs) {
      final data = questionDoc.data();
      final questionAnswers = <Answer>[];
      for(var ans in data['answers']) {
        questionAnswers.add(answers.firstWhere((element) => element.id == ans));
      }

      questions.add(Question(
        id: questionDoc.id,
        sentence: data['sentence'],
        answers: questionAnswers,
        rightAnswer: data['rightAnswer'],
        category: category.sentence,
      ));
    }

    questions.shuffle();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var trivia = Trivia(category: category, questions: questions.sublist(0,20), duration: 0, answers: <String,String>{}, userId: user.uid);
      return trivia;
    }
    throw(Exception('You are not logged.'));
  }

  @override
  void saveTrivia(Trivia trivia) {
    FirebaseFirestore.instance.collection('trivias').add(trivia.triviaToFirebase());
  }

}