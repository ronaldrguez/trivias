part of '../services/hive_service.dart';

enum HiveBoxes {
// Collections
  usersBox('user_box'),
  answerBox('answer_box'),
  questionBox('question_box'),
  preferencesBox('preferences_box'),
  triviaBox('trivia_box'),
  categoryBox('category_box');

  const HiveBoxes(this.value);

  final String value;
}