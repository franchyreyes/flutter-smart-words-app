import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:findwords/db/category_dao.dart';
import 'package:findwords/fake/FakeDB.dart';
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
      final categoryList = await _categoryDAO.getAllCategory();
      emit(CategoriesLoadedState(categoryList));
    } catch (e) {
      emit(CategoryErrorState(e.toString()));
    }
  }

  Future<void> addRandomCategory() async {
    try {
      emit(CategoriesLoadingState());
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(0));
      var categoryList = await _categoryDAO.getAll(Category());
      emit(CategoriesLoadedState(categoryList));
    } catch (e) {
      print(e.toString());
      emit(CategoryErrorState(e.toString()));
    }
  }

  Future<void> loadAllCategory() async {
    try {
      await _categoryDAO.deleteTable();
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(0));
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(1));
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(2));
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(3));
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(4));
      await _categoryDAO.put(RandomCategoryGenerator.getRandomCategory(5));

    } catch (e) {
      print("Error Category: " + e.toString());
    }
  }
}

