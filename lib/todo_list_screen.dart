import 'package:flutter/material.dart';
import '../task_model.dart';

class TodoListScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: 'Change engine oil', vehicle: 'Honda Civic', dueDate: DateTime.now().add(Duration(days: 7))),
    Task(title: 'Check tire pressure', vehicle: 'Toyota Corolla', dueDate: DateTime.now().add(Duration(days: 14))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('Due: ${task.dueDate.toLocal()}'),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (bool? value) {
                task.isCompleted = value ?? false;
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
