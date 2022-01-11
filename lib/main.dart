import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validus_coin/bloc/home_bloc.dart';
import 'package:validus_coin/data/repository/home_repository.dart';
import 'package:validus_coin/ui/bottom_tab_screen.dart';
import 'package:validus_coin/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  BlocProvider(
        create: (context) => HomeBloc(repository: HomeRepositoryImpl()),
        child: const HomePage(),
      ),
    );
  }
}

