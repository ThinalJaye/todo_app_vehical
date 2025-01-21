import 'package:flutter/material.dart';

class AddEditTaskScreen extends StatelessWidget {
  final bool isEdit;
  final String? title;

  AddEditTaskScreen({this.isEdit = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Task' : 'Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Vehicle'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Due Date'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Priority'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(isEdit ? 'Save Changes' : 'Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
