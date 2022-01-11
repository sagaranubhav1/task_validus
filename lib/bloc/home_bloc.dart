import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:validus_coin/bloc/home_event.dart';
import 'package:validus_coin/bloc/home_state.dart';
import 'package:validus_coin/data/models/api_result_model.dart';
import 'package:validus_coin/data/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeRepository repository;

  HomeBloc({@required this.repository}) : super(null) ;

  @override
  // TODO: implement initialState
  HomeState get initialState => HomeInitialState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchHomeEvent) {
      yield HomeLoadingState();
      try {
        ApiResultModel _apiResultModel = await repository.getApiData();
        yield HomeLoadedState(apiResultModel: _apiResultModel);
      } catch (e) {
        yield HomeErrorState(message: e.toString());
      }
    }
  }
}
