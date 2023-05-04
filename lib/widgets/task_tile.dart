import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? taskTitle;
  final Function(bool?) checkBoxCallBack;
  Function() longPressCallBack;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.longPressCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
