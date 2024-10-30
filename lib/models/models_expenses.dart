import 'package:my_app_despesas/models/category.dart';
import 'package:my_app_despesas/models/user_model.dart';

class ModelsExpenses {
  int? id;
  String? description;
  String? date;
  int? categoryId;
  int? userId;
  UserModel? user;
  CategoryModel? category;

  ModelsExpenses({
    required this.id,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.userId,
    this.user,
    this.category,
  });

  factory ModelsExpenses.fromMap(Map<String, dynamic> map) {
    return ModelsExpenses(
      id: map['id'],
      description: map['description'],
      date: map['date'],
      categoryId: map['category_id'],
      userId: map['user_id'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      category: map['category'] != null
          ? CategoryModel.fromMap(map['category'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'date': date,
      'category_id': categoryId,
      'user_id': userId,
      'user': user?.toMap(),
      'category': category?.toJson(),
    };
  }
}
