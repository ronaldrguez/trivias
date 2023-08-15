import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/repository/trivia_repository.dart';

part 'package:trivia/bloc/trivia/trivia_event.dart';
part 'package:trivia/bloc/trivia/trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  final TriviaRepository _repository;
  TriviaBloc(this._repository) : super(UnTriviaState()) {
    on<LoadingTriviaEvent>((event, emit) async {
      emit(LoadTriviaState());
      final trivia = _repository.getTrivia(event.category);
      emit(InTriviaState(trivia: trivia, start: DateTime.now()));
    });

    on<NextQuestionEvent>((event, emit) async {
      Map<int, int> answers = <int, int>{};
      if (event.trivia.answers.keys.isNotEmpty) {
        event.trivia.answers.forEach((key, value) {
          answers[key] = value;
        });
      }
      answers[event.questionId] = event.response;
      if (state is InTriviaState) {
        final auxState = (state as InTriviaState);
        emit(auxState.copyWith(
            trivia: event.trivia.copyWith(answers: answers),
            isIncrement: true));
      }
    });

    on<BackQuestionEvent>((event, emit) async {
      if (state is InTriviaState) {
        final auxState = (state as InTriviaState);
        emit(auxState.copyWith(trivia: event.trivia, isIncrement: false));
      }
    });

    on<FinishTriviaEvent>((event, emit) async {
      if (state is InTriviaState) {
        final auxState = (state as InTriviaState);
        var finish = DateTime.now();
        Map<int, int> answers = <int, int>{};
        if (event.trivia.answers.keys.isNotEmpty) {
          event.trivia.answers.forEach((key, value) {
            answers[key] = value;
          });
        }
        answers[event.trivia.questions.last.id] = event.response;
        var trivia = event.trivia.copyWith(
            answers: answers,
            duration: finish.difference(auxState.start).inSeconds);
        _repository.saveTrivia(trivia);
        emit(CompleteTriviaState(trivia));
      }
    });
  }
}
