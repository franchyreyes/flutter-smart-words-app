part of 'category_cubit.dart';

abstract class CategoryState{
}

class CategoryInitialState extends CategoryState {

}


class CategoriesLoadedState extends CategoryState {
  final List<Category> categoryList;

  CategoriesLoadedState(this.categoryList);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoriesLoadedState && o.categoryList == categoryList;
  }

  @override
  int get hashCode => categoryList.hashCode;
}

class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState(this.message);


  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

}

class CategoriesLoadingState extends CategoryState {


}