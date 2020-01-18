import 'package:flutter/material.dart';
import 'package:todotask_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';
import 'package:todotask_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
              itemCount: taskData.itemCount,
              itemBuilder: (context, int index) {
                var task = taskData.tasks[index];
                return TileList(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCallback: (checkBoxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.removeTask(task);
                  },
                  timeNow: taskData.timeNow,
                );
              });
        },
      ),
    );
  }
}
