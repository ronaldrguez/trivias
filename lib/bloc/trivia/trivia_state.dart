part of 'trivia_bloc.dart';

abstract class TriviaState extends Equatable{
  TriviaState copyWith();
}

class UnTriviaState extends TriviaState {
  @override
  List<Object?> get props => [];

  @override
  TriviaState copyWith() {
    return UnTriviaState();
  }

}

class LoadTriviaState extends TriviaState {
  @override
  List<Object?> get props => [];

  @override
  TriviaState copyWith() {
    return LoadTriviaState();
  }

}

class InTriviaState extends TriviaState {
  final Trivia trivia;
  final DateTime start;
  final int index;
  
  InTriviaState({required this.trivia, required this.start, this.index = 0,});

  @override
  InTriviaState copyWith({Trivia? trivia, bool? isIncrement,}) {
    return InTriviaState(trivia: trivia ?? this.trivia, index: isIncrement != null ? isIncrement ? index + 1: index - 1 : index ,start: start);
  }

  @override
  List<Object?> get props => [trivia, index];
}

class CompleteTriviaState extends TriviaState {
  final Trivia trivia;

  CompleteTriviaState(this.trivia);

  @override
  List<Object?> get props => [trivia];

  @override
  TriviaState copyWith() {
    return CompleteTriviaState(trivia);
  }
}