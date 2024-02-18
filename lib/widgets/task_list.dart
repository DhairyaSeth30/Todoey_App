import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
// import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final taskData = Provider.of<TaskData>(context); // Retrieve TaskData instance
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
            // final taskData = Provider.of<TaskData>(context, listen: false); // Get instance of TaskData
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkBoxState) {
                //   setState(() {
                //     Provider.of<TaskData>(context).tasks[index].toggleDone();
                // });
                // Provider.of<TaskData>(context, listen: false).updateTask(TaskData().tasks[index]); NOT WORKING
                taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
                
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      }
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todoey/models/task.dart';
// import 'package:todoey/models/task_data.dart';
// import 'package:todoey/widgets/task_tile.dart';

// class TasksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskData>(
//       builder: (context, taskData, child) {
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             final task = taskData.tasks[index];

//             return GestureDetector(
//               onLongPress: () {
//                 taskData.deleteTask(task);
//               },
//               child: TaskTile(
//                 isChecked: task.isDone,
//                 taskTitle: task.name,
//                 checkboxCallback: (checkBoxState) {
//                   taskData.updateTask(task);
//                 },
//               ),
//             );
//           },
//           itemCount: taskData.tasks.length,
//         );
//       },
//     );
//   }
// }
