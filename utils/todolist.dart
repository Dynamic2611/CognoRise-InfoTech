import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged, 
    required this.deleteFunction,
  });


  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                  backgroundColor: const Color.fromARGB(255, 222, 221, 221),
                )
              ],
              ),
            child: Container(
              
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 105, 255),
                borderRadius: BorderRadius.circular(15)
              ),
              
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    value: taskCompleted, 
                    onChanged: onChanged,
                    side: const BorderSide(
                      color: Colors.white
                      ),
                    ),
            
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}