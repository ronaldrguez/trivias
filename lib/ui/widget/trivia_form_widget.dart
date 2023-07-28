import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/bloc/trivia/trivia_bloc.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/ui/widget/dialog_widget.dart';

class TriviaFormWidget extends StatefulWidget {
  final int index;
  final Trivia trivia;

  const TriviaFormWidget({super.key, required this.index, required this.trivia});

  @override
  State<StatefulWidget> createState() => _TriviaFormWidgetState();
}

class _TriviaFormWidgetState extends State<TriviaFormWidget> {
  int? _response;
  late Question _question;

  @override
  void initState() {
    _question = widget.trivia.questions.elementAt(widget.index);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TriviaFormWidget oldWidget) {
    _question = widget.trivia.questions.elementAt(widget.index);
    _response = widget.trivia.answers[_question.id];
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Question ${widget.index + 1} of ${widget.trivia.questions.length}', style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
          const SizedBox(height: 20,),
          Text(_question.sentence, style: Theme.of(context).textTheme.titleLarge,),

          ..._question.answers.map<Widget>((answer) => RadioListTile(value: answer.id, groupValue: _response, title: Text(answer.sentence), onChanged: (value) {
            _response = value!;
            setState(() {});
          })),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: (widget.index == 0 ) ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
            children: [
              if(widget.index > 0)
                OutlinedButton(onPressed: (){
                  context.read<TriviaBloc>().add(BackQuestionEvent(questionId: _question.id));
                }, child: const Text('Back')),
              if(widget.index < widget.trivia.questions.length - 1)
                ElevatedButton(onPressed: (){
                  if(_response != null) {
                    context.read<TriviaBloc>().add(NextQuestionEvent(questionId: _question.id, response: _response!));
                  } else {
                    DialogService.showInfo(context, title: 'Alert', content: const Text('You must choose one option'));
                  }
                }, child: const Text('Next')),
              if(widget.index == widget.trivia.questions.length - 1)
                ElevatedButton(onPressed: () {
                  if(_response != null) {
                    context.read<TriviaBloc>().add(FinishTriviaEvent(response: _response!));
                  } else {
                    DialogService.showInfo(context, title: 'Alert', content: const Text('You must choose one option'));
                  }
                }, child: const Text('Finish')),
            ],
          )
        ],
      ),
    );
  }

}