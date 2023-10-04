part of 'trivia_bloc.dart';

abstract class TriviaEvent {}

class LoadingTriviaEvent extends TriviaEvent {
  final CategoryTrivia category;
  LoadingTriviaEvent({required this.category});

}

class NextQuestionEvent extends TriviaEvent {
  final String response;
  final String questionId;
  final Trivia trivia;

  NextQuestionEvent({required this.response, required this.questionId, required this.trivia});
}

class BackQuestionEvent extends TriviaEvent {
  final String questionId;
  final Trivia trivia;

  BackQuestionEvent({required this.questionId, required this.trivia});

}

class FinishTriviaEvent extends TriviaEvent {
  final String response;
  final Trivia trivia;

  FinishTriviaEvent({required this.response, required this.trivia });
}