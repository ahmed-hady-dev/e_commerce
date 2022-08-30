part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  @override
  List<Object?> get props => [categories];

  const CategoryLoaded({this.categories = const <Category>[]});
}

class CategoryError extends CategoryState {
  @override
  List<Object?> get props => [];
}
