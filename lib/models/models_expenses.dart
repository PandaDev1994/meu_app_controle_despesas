class ModelsExpenses {
  int? id;
  String? description;
  String? date;
  int? categoryId;
  int? userId;

  ModelsExpenses({
    required this.id,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.userId,
  });

  factory ModelsExpenses.fromMap(Map<String, dynamic> map) {
    return ModelsExpenses(
      id: map['id'],
      description: map['description'],
      date: map['date'],
      categoryId: map['category_id'],
      userId: map['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'date': date,
      'category_id': categoryId,
      'user_id': userId,
    };
  }
}
