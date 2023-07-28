part of 'trivia_bloc.dart';

abstract class TriviaState extends Equatable{}

class UnTriviaState extends TriviaState {
  @override
  List<Object?> get props => [];

}

class LoadTriviaState extends TriviaState {
  @override
  List<Object?> get props => [];

}

class InTriviaState extends TriviaState {
  final Trivia trivia;
  final DateTime start;
  final int index;
  InTriviaState({required this.trivia, required this.start, this.index = 0,});

  @override
  List<Object?> get props => [trivia, index];
}

class CompleteTriviaState extends TriviaState {
  final Trivia trivia;

  CompleteTriviaState(this.trivia);

  @override
  List<Object?> get props => [trivia];
}