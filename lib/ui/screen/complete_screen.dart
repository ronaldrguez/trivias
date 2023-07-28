import 'dart:math';

import 'package:app_navigator/app_navigator.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/bloc/ranking/ranking_bloc.dart';
import 'package:trivia/models/trivia.dart';

class CompleteScreen extends StatefulWidget{
  final Trivia trivia;

  const CompleteScreen({super.key, required this.trivia});

  @override
  State<StatefulWidget> createState() => _CompleteScreenState();

}

class _CompleteScreenState extends State<CompleteScreen> {
  final controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    controller.play();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ConfettiWidget(confettiController: controller, blastDirectionality: BlastDirectionality.explosive, child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Congrats you have ${widget.trivia.rightAnswers} of ${widget.trivia.answers.values.length}!!!', style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
                    if(isPlaying) {
                      controller.stop();
                    }
                    context.read<RankingBloc>().add(LoadingRankingEvent());
                    AppNavigator().pop();
                  }, child: const Text('Go to Ranking'))
              ],
            )),
          ),
        );
  }

}