import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/bloc/ranking/ranking_bloc.dart';
import 'package:trivia/models/answer.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';
import 'package:trivia/repository/ranking_repository.dart';

import 'ranking_bloc_test.mocks.dart';

/// sut - System under test
@GenerateMocks([RankingRepository])
void main() {
  late RankingBloc sut;
  late RankingRepository repo;
  late List<Trivia> fakeValue;
  late User foundUser;

  setUpAll(() {
    repo = MockRankingRepository();
    Map<int, int> answers = <int, int>{};
    for (int i = 0; i < 20; i++) {
      answers[i] = 2;
    }
    fakeValue = [
      Trivia(
        id: 'asdadasfasf',
        category: 'Biology',
        questions: List.generate(
            20,
            (index) => Question(
                  id: index,
                  sentence:
                      "Scripserit nostrum magna minim efficiantur inceptos facilis orci.",
                  answers: List.generate(5,
                      (id) => Answer(id: id, sentence: "North Melaniamouth")),
                  category: 'Biology',
                  rightAnswer: Random().nextInt(5),
                )),
        duration: 0,
        answers: answers,
        userId: 'qweqwevfdfsdfv',
      )
    ];
    foundUser = User(
        id: fakeValue.first.userId,
        userName: 'xxasd',
        password: '1234',
        name: 'Carlos',
        results: []);
  });

  group('Testing RankingBloc', () {
    setUp(() => sut = RankingBloc(repo));

    test('Initial Test', () => expect(sut.state, UnTriviaState()));

    blocTest<RankingBloc, RankingState>('When start the app ranking is empty',
        build: () => sut,
        act: (bloc) {
          when(repo.getAllTrivias()).thenAnswer((_) => []);
          bloc.add(LoadingRankingEvent());
        },
        expect: () => <RankingState>[
              LoadRankingState(),
              InRankingState(trivias: const [], users: const {})
            ]);

    blocTest<RankingBloc, RankingState>('When the ranking has one item',
        build: () => sut,
        act: (bloc) {
          when(repo.getAllTrivias()).thenAnswer((_) => fakeValue);
          when(repo.findUser(fakeValue.first.userId))
              .thenAnswer((_) => foundUser);
          bloc.add(LoadingRankingEvent());
        },
        expect: () => <RankingState>[
              LoadRankingState(),
              InRankingState(trivias: fakeValue, users: {foundUser})
            ]);

    blocTest<RankingBloc, RankingState>('When the ranking has an error',
        build: () => sut,
        act: (bloc) {
          when(repo.getAllTrivias()).thenThrow(Exception('Error'));
          bloc.add(LoadingRankingEvent());
        },
        expect: () => <RankingState>[
              LoadRankingState(),
              ErrorRankingState(Exception('Error').toString())
            ]);
  });
}
