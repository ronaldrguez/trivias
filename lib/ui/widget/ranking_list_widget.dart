import 'package:flutter/material.dart';
import 'package:trivia/models/trivia.dart';
import 'package:trivia/models/user.dart';

class RankingList extends StatelessWidget {
  final List<Trivia> trivias;
  final Set<User> users;

  const RankingList({super.key, required this.trivias, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            leading: Text('Pos', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigoAccent),),
            title: Text('Users', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigoAccent),),
            trailing: Text('Duration', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigoAccent),),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: trivias.length,
          itemBuilder: (BuildContext context, int index) {
            return RankingListItem(pos: index + 1, trivia: trivias.elementAt(index), userName: users.firstWhere((user) => user.id == trivias.elementAt(index).userId).name);
          },
        )
      ],),
    );
  }
}

class RankingListItem extends StatelessWidget {
  final Trivia trivia;
  final String userName;
  final int pos;

  const RankingListItem({super.key, required this.pos, required this.trivia, required this.userName});

  @override
  Widget build(BuildContext context) {
    var min = trivia.duration ~/ 60;
    var sec = trivia.duration - (min * 60);
    return ListTile(
      leading: Text('$pos'),
      title: Text(userName),
      subtitle: Text('${trivia.rightAnswers} of ${trivia.questions.length}'),
      trailing: Text('$min : $sec'),
    );
  }
}