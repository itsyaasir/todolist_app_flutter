import 'package:flutter/material.dart';

class TileList extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkBoxCallback;
  final Function longPressCallback;
  final String timeNow;
  TileList(
      {this.taskTitle,
      this.isChecked,
      this.checkBoxCallback,
      this.longPressCallback,
      this.timeNow});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      leading: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallback,
        activeColor: Color(0xFFFA6668),
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
            color: isChecked ? Colors.grey : Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Text(
        timeNow,
      ),
    );
  }
}
