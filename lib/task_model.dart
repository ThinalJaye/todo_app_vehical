class Task {
  String title;
  String vehicle;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.title,
    required this.vehicle,
    required this.dueDate,
    this.isCompleted = false,
  });
}
