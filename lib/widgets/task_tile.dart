import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final VoidCallback longPressCallback;

  //Getting error while passing the longPressCallback function in TaskTile to delete the task.The error you're encountering suggests that you're trying to modify the state of the widget during its build phase, which is not allowed.
  //By passing the onLongPressed callback to the TaskTile, you ensure that the state modification (deleting the task)
  // happens in the parent widget (TasksList), not within the TaskTile widget's build phase.

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback, required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: 
          isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue){
          checkboxCallback(newValue);
        },
      ),
    );
  }
}


// void checkboxCallback(checkBoxState) {
//     setState(() {
//       isChecked = checkBoxState;
//   });
// }

// class TaskCheckBox extends StatelessWidget {

//   final bool checkBoxState;
//   final Function toggleCheckboxState;

//   TaskCheckBox({required this.checkBoxState, required this.toggleCheckboxState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkBoxState,
//       onChanged:(value) {
//         toggleCheckboxState(value);
//       },
//     );
//   }
// }















