import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:trivia/bloc/trivia/trivia_bloc.dart';
import 'package:trivia/models/answer.dart';
import 'package:trivia/models/category_trivia.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/repository/trivia_repository.dart';

import 'trivia_bloc_test.mocks.dart';


/// sut - System under test
@GenerateMocks([TriviaRepository])
void main () {
  late TriviaBloc sut;
  late TriviaRepository repo;
  late Trivia fakeValue;
  late DateTime startTrivia;

  setUpAll(() {
    var answers = <String,String>{};
    for (int i = 0; i < 20; i++) {
      answers[i.toString()] = 2.toString();
    }
    fakeValue = Trivia(
      id: 'asdadasfasf',
      category: const CategoryTrivia(id: '1', sentence: 'Biology'),
      questions: List.generate(20, (index) => Question(
        id: index.toString(),
        sentence: "Scripserit nostrum magna minim efficiantur inceptos facilis orci.",
        answers: List.generate(5, (id) => Answer(id: id.toString(), sentence: "North Melaniamouth")),
        category: 'Biology',
        rightAnswer: Random().nextInt(5).toString(),
      )),
      duration: 0,
      answers: answers,
      userId: 'qweqwevfdfsdfv',
    );
  });

  group('Testing RankingBloc', ()
  {

    setUp((){
      repo = MockTriviaRepository();
      startTrivia = DateTime.now();
      sut = TriviaBloc(repo);
    });

    test('Initial Test', () => expect(sut.state, UnTriviaState()));

    blocTest<TriviaBloc, TriviaState>('When load a trivia',
        build: () => sut,
        act: (bloc) {
          when(repo.getTrivia(const CategoryTrivia(id: '1', sentence: 'Biology'))).thenAnswer((_) async => fakeValue);
          bloc.add(LoadingTriviaEvent(category: const CategoryTrivia(id: '1', sentence: 'Biology')));
        },
        expect: () => <TriviaState>[LoadTriviaState(), InTriviaState(trivia: fakeValue, start: startTrivia)]
    );

    blocTest<TriviaBloc, TriviaState>('When next question trivia game',
        build: () {
          when(repo.getTrivia(const CategoryTrivia(id: '1', sentence: 'Biology'))).thenAnswer((_) async => fakeValue);
          return sut;
        },
        seed: () => InTriviaState(trivia: fakeValue, start: startTrivia),
        act: (bloc) {
          bloc.add(NextQuestionEvent(response: 2.toString(), questionId: 1.toString(), trivia: fakeValue));
        },
        expect: () => <TriviaState>[InTriviaState(trivia: fakeValue, index: 1, start: startTrivia)]
    );

    blocTest<TriviaBloc, TriviaState>('When tap previous question trivia game',
        build: () {
          when(repo.getTrivia(const CategoryTrivia(id: '1', sentence: 'Biology'))).thenAnswer((_) async => fakeValue);
          return sut;
        },
        seed: () => InTriviaState(trivia: fakeValue, index: 2, start: startTrivia),
        act: (bloc) {
          bloc.add(BackQuestionEvent(questionId: 2.toString(), trivia: fakeValue));
        },
        expect: () => <TriviaState>[InTriviaState(trivia: fakeValue, index: 1, start: startTrivia)]
    );

    blocTest<TriviaBloc, TriviaState>('When finish trivia game',
        build: () {
          when(repo.getTrivia(const CategoryTrivia(id: '1', sentence: 'Biology'))).thenAnswer((_) async => fakeValue);
          return sut;
        },
        seed: () => InTriviaState(trivia: fakeValue, index: 18, start: startTrivia),
        act: (bloc) {
          bloc.add(FinishTriviaEvent(response: 2.toString(), trivia:  fakeValue));
        },
        expect: () => <TriviaState>[CompleteTriviaState(fakeValue)]
    );
  });
}