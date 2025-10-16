import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/enums/category_enum.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryEnum? selectedCategory;
  selectCategory(CategoryEnum category) {
    selectedCategory = category;
    notifyListeners();
  }

  goToHome() {
    selectedCategory = null;
    notifyListeners();
  }
}
