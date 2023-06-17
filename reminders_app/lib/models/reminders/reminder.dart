class Reminder {
  String? id;
  final String title;
  final String categoryId;
  final String? notes;
  final Map<String, dynamic> list;
  final int dueDate;
  final Map<String, dynamic> dueTime;

  Reminder({
    required this.id,
    required this.title,
    this.notes,
    required this.list,
    required this.categoryId,
    required this.dueDate,
    required this.dueTime,
  });

  Reminder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        categoryId = json['category_id'],
        notes = json['notes'],
        list = json['list'],
        dueDate = json['due_date'],
        dueTime = json['due_time'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category_id': categoryId,
        'notes': notes,
        'list': list,
        'due_date': dueDate,
        'due_time': dueTime
      };
}
