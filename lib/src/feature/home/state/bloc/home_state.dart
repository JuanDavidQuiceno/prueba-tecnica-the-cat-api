part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState({this.data = const []});
  final List<CatModel> data;
  @override
  List<Object> get props => [data];
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.data});
}

final class HomeSearchState extends HomeState {
  // const HomeSearchState(super.catModel);
  const HomeSearchState({
    required super.data,
    required this.catModelSearch,
  });
  final List<CatModel> catModelSearch;
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.data});
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required super.data,
  });
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.message,
    required super.data,
  });
  final String message;
}
