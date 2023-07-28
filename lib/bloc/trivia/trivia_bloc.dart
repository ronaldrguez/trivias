import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/repository/trivia_repository.dart';

part 'package:trivia/bloc/trivia/trivia_event.dart';
part 'package:trivia/bloc/trivia/trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent,TriviaState> {
  final TriviaRepository _repository;
  TriviaBloc(this._repository) : super(UnTriviaState()){

    on<LoadingTriviaEvent>((event, emit) async {
      emit(LoadTriviaState());
      final trivia = _repository.getTrivia(event.category);
      emit(InTriviaState(trivia: trivia, start: DateTime.now()));
    });

    on<NextQuestionEvent>((event, emit) async {
    final auxState = (state as InTriviaState);
    final trivia = auxState.trivia;
    Map<int, int> answers = <int,int>{};
    if(trivia.answers.keys.isNotEmpty) {
      trivia.answers.forEach((key, value) {
        answers[key] = value;
      });
    }
    answers[event.questionId] = event.response;
    emit(InTriviaState(trivia: trivia.copyWith(answers: answers), index: auxState.index + 1, start: auxState.start),);
    });

    on<BackQuestionEvent>((event, emit) async {
      final auxState = (state as InTriviaState);
      emit(InTriviaState(trivia: auxState.trivia, index: auxState.index - 1, start: auxState.start));
    });

    on<FinishTriviaEvent>((event, emit) async {
      final auxState = (state as InTriviaState);
      var trivia = auxState.trivia;
      var finish = DateTime.now();
      Map<int, int> answers = <int,int>{};
      if(trivia.answers.keys.isNotEmpty) {
        trivia.answers.forEach((key, value) {
          answers[key] = value;
        });
      }
      answers[trivia.questions.last.id] = event.response;
      trivia = trivia.copyWith(answers: answers, duration: finish.difference(auxState.start).inSeconds);
      _repository.saveTrivia(trivia);
      emit(CompleteTriviaState(trivia));
      });
  }
}