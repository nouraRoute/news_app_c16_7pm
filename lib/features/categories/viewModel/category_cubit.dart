import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c16_7pm/features/categories/data/enums/category_enum.dart';

class CategoryCubit extends Cubit<CategoryEnum?> {
  CategoryCubit() : super(null);

  selectCategory(CategoryEnum category) {
    emit(category);
  }

  goToHome() {
    emit(null);
  }
}
