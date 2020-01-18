import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todotask_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todotask_app/models/task_data.dart';
import 'add_tasks.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Consumer<TaskData>(
          builder: (context, taskData, child) {
            return Container(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            '${taskData.day} , ',
                            style: TextStyle(
                                color: Color(0xff666afb),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${taskData.date}',
                            style: TextStyle(
                              color: Color(0xff666afb),
                              fontSize: 25.0,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).itemCount} Tasks',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${taskData.month}',
                    style: TextStyle(color: Colors.grey, fontSize: 17.0),
                  ),
                ],
              ),
            );
          },
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: Divider(
                color: Colors.grey,
                thickness: 0.3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: FloatingActionButton(
                backgroundColor: Color(0xFFFA6668),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return AddTasks();
                      });
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        Expanded(child: TasksList()),
      ],
    );
  }
}
