import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryDAO _categoryDAO  = CategoryDAO();

  CategoryCubit() : super(CategoryInitialState());

  Future<void> reloadCategory() async {
    try {
      emit(CategoriesLoadingState());
      final categoryList = await _categoryDAO.getAll(Category());
      emit(CategoriesLoadedState(categoryList));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  Future<void> addRandomCategory() async {
    try {
      emit(CategoriesLoadingState());
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory());
      var categoryList = await _categoryDAO.getAll(Category());
      emit(CategoriesLoadedState(categoryList));
    } catch (e) {
      print(e.toString());
      emit(CategoryErrorState(e.toString()));
    }
  }
}

class RandomCategoryGenerator {
  static final _categories = [
    Category(name: 'Banana', documentID: "1x"),
    Category(name: 'Strawberry', documentID: "2x"),
    Category(name: 'Kiwi', documentID: "3x"),
    Category(name: 'Apple', documentID: "4x"),
    Category(name: 'Pear', documentID: "5x"),
    Category(name: 'Lemon', documentID: "6x"),
  ];

  static Category getRandomCategory() {
    return _categories[Random().nextInt(_categories.length)];
  }
}
