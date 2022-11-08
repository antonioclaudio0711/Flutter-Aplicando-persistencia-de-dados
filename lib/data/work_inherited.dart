import 'package:flutter/material.dart';
import 'package:principios/elements/work_card.dart';

class WorkInherited extends InheritedWidget {
  WorkInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<WorkCard> workList = [
    WorkCard(
      text: 'Aprender Flutter',
      image: 'assets/images/flutter_logo.png',
      difficulty: 4,
    ),
    WorkCard(
      text: 'Aprender Dart',
      image: 'assets/images/dart_logo.png',
      difficulty: 3,
    ),
    WorkCard(
      text: 'Faculdade',
      image: 'assets/images/university_logo.png',
      difficulty: 2,
    ),
  ];

  void newWork(String name, String photo, int difficulty) {
    workList.add(
      WorkCard(
        text: name,
        image: photo,
        difficulty: difficulty,
      ),
    );
  }

  static WorkInherited of(BuildContext context) {
    final WorkInherited? result =
        context.dependOnInheritedWidgetOfExactType<WorkInherited>();
    assert(result != null, 'No WorkInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(WorkInherited oldWidget) {
    return oldWidget.workList.length != workList.length;
  }
}
