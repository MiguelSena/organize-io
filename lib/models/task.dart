class Task {
  final String title;
  final String time;
  final int id;

  Task({required this.title, required this.time, required this.id});

  factory Task.fromMap(Map<String, dynamic> json) => Task(
    title: json['title'],
    time: json['time'],
    id: json['id'],
  );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'id': id
    };
  }

  @override
  String toString() {
    return 'Title: $title - Time: $time - Id: $id';
  }
}