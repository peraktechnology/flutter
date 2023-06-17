class Accounts {
  final String title;
  final String description;
  final double amount;
  final String date;
  final String time;
  final String type;
  Accounts({
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
    required this.type,
  });

 factory Accounts.fromJson(Map<String, dynamic> json) {
    return Accounts(
      title: json['title'],
      description: json['description'],
      amount: json['amount'],
      date: json['date'],
      time: json['time'],
      type: json['type'],
    );
  }
}
