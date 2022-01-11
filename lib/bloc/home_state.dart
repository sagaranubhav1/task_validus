import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:validus_coin/data/models/api_result_model.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final ApiResultModel apiResultModel;

  HomeLoadedState({@required this.apiResultModel});

  @override
  // TODO: implement props
  List<Object> get props => [apiResultModel];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
