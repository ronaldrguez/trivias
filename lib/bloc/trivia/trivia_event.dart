part of 'trivia_bloc.dart';

abstract class TriviaEvent {}

class LoadingTriviaEvent extends TriviaEvent {
  final String category;
  LoadingTriviaEvent({required this.category});

}

class NextQuestionEvent extends TriviaEvent {
  final int response;
  final int questionId;
  final Trivia trivia;

  NextQuestionEvent({required this.response, required this.questionId, required this.trivia});
}

class BackQuestionEvent extends TriviaEvent {
  final int questionId;
  final Trivia trivia;

  BackQuestionEvent({required this.questionId, required this.trivia});

}

class FinishTriviaEvent extends TriviaEvent {
  final int response;
  final Trivia trivia;

  FinishTriviaEvent({required this.response, required this.trivia });
}