import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotask_app/models/task_data.dart';

class AddTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    String newTaskTitle;
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Tasks',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff666afb), fontSize: 30.0),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusColor: Color(0xff666afb),
                  ),
                  onChanged: (newVal) {
                    newTaskTitle = newVal;
                  },
                ),
                FlatButton(
                  color: Color(0xFFFA6668),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
