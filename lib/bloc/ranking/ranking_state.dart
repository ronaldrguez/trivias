part of 'ranking_bloc.dart';

abstract class RankingState extends Equatable{}

class UnTriviaState extends RankingState {
  @override
  List<Object?> get props => [];

}

class LoadRankingState extends RankingState {
  @override
  List<Object?> get props => [];

}

class InRankingState extends RankingState {
  final List<Trivia> trivias;
  final Set<User> users;
  InRankingState({required this.trivias, required this.users});

  @override
  List<Object?> get props => [trivias, users];
}

class ErrorRankingState extends RankingState {
  final String message;

  ErrorRankingState(this.message);

  @override
  List<Object?> get props => [message];
}