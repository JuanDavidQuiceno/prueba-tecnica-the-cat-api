import 'dart:async';

import 'package:app/src/feature/home/data/car_repository.dart';
import 'package:app/src/feature/home/domain/cat_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required CatRepository repository,
  }) : _repository = repository,
       super(const HomeInitial(data: [])) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeEvent>(_getHomeEvent);
    on<SearchHomeEvent>(_searchHomeEvent);
  }

  final CatRepository _repository;

  FutureOr<void> _getHomeEvent(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState(data: []));
    try {
      emit(
        HomeLoadedState(
          data: await _repository.getCats(),
        ),
      );
    } catch (e) {
      emit(
        HomeErrorState(
          message: e.toString(),
          data: state.data,
        ),
      );
    }
  }

  FutureOr<void> _searchHomeEvent(
    SearchHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState(data: state.data));
    final catModelSearch = state.data
        .where(
          (element) => element.name!.toLowerCase().contains(event.query),
        )
        .toList();

    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      return emit(
        HomeSearchState(
          data: state.data,
          catModelSearch: catModelSearch,
        ),
      );
    });
  }
}
