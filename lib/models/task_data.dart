import 'package:flutter/material.dart';
import 'tasks.dart';
import 'package:collection/collection.dart';
import 'package:jiffy/jiffy.dart';

class TaskData extends ChangeNotifier {
  var now = DateTime.now();
  List<Tasks> _tasks = [
    Tasks(name: 'Go to Swimming'),
    Tasks(name: 'Go Skating'),
    Tasks(name: 'Visit the gym'),
  ];
  UnmodifiableListView<Tasks> get tasks => UnmodifiableListView(_tasks);

  int get itemCount => _tasks.length;

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(newTask) {
    _tasks.add(Tasks(name: newTask));
    notifyListeners();
  }

  void removeTask(Tasks task) {
    _tasks.remove(task);
    notifyListeners();
  }

  String get timeNow {
    return Jiffy(DateTime.now()).jm;
  }

  String get month {
    return Jiffy(DateTime.now()).MMMM;
  }

  String get day {
    return Jiffy(DateTime.now()).EEEE;
  }

  String get date {
    return Jiffy(DateTime.now()).format('do');
  }
}
