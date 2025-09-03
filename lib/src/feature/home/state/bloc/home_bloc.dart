import 'dart:async';

import 'package:app/src/feature/home/domain/cat_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(data: [])) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeEvent>(_getHomeEvent);
    on<SearchHomeEvent>(_searchHomeEvent);
  }

  FutureOr<void> _getHomeEvent(
    GetHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState(data: []));
    try {
      // emit(
      //   HomeLoad xdedState(
      //     catMod xfcdel: await HomeImplementation(apiSdk: ApiSdk()).getHome(),
      //   ),
      // );
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
    // final catModelSearch = state.catModel
    //     .where(
    //       (element) => element.name!.toLowerCase().contains(event.query),
    //     )
    //     .toList();
    // ignore: inference_failure_on_instance_creation
    // await Future.delayed(const Duration(milliseconds: 500)).then((value) {
    //   return emit(
    //     HomeSearchState(
    //       catModel: state.catModel,
    //       catModelSearch: catModelSearch,
    //     ),
    //   );
    // });
  }
}
