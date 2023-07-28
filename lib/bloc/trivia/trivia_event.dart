part of 'trivia_bloc.dart';

abstract class TriviaEvent {}

class LoadingTriviaEvent extends TriviaEvent {
  final String category;
  LoadingTriviaEvent({required this.category});

}

class NextQuestionEvent extends TriviaEvent {
  final int response;
  final int questionId;

  NextQuestionEvent({required this.response, required this.questionId});
}

class BackQuestionEvent extends TriviaEvent {
  final int questionId;

  BackQuestionEvent({required this.questionId});

}

class FinishTriviaEvent extends TriviaEvent {
  final int response;

  FinishTriviaEvent({required this.response});
}