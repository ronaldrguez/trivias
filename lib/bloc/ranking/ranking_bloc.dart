import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/repository/ranking_repository.dart';

part 'package:trivia/bloc/ranking/ranking_event.dart';
part 'package:trivia/bloc/ranking/ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent,RankingState> {
  final RankingRepository _repository;
  RankingBloc(this._repository) : super(UnTriviaState()){

    on<LoadingRankingEvent>((event, emit) async {
      try {
        emit(LoadRankingState());
        final trivias = _repository.getAllTrivias();
        final Set<User> users = <User>{};
        for (var trivia in trivias) {
          users.add(_repository.findUser(trivia.userId));
        }
        emit(InRankingState(
          trivias: trivias,
          users: users
        ));
      } catch (e){
        emit(ErrorRankingState(e.toString()));
      }
    });
  }
}