import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validus_coin/bloc/home_bloc.dart';
import 'package:validus_coin/bloc/home_event.dart';
import 'package:validus_coin/bloc/home_state.dart';
import 'package:validus_coin/res/app_colors.dart';
import 'package:validus_coin/ui/bottom_tab_screen.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();

    ///api call
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(FetchHomeEvent());

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              body: BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeErrorState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeInitialState) {
                      return buildLoading();
                    } else if (state is HomeLoadingState) {
                      return buildLoading();
                    } else if (state is HomeLoadedState) {
                      return TabsScreen(state.apiResultModel);
                    } else if (state is HomeErrorState) {
                      return buildErrorUi(state.message);
                    }
                    return Container();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ///ERROR UI
  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  ///MAIN UI
  Widget buildImageView(List<dynamic> imageList) {
     final orientation = MediaQuery.of(context).orientation;
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int pos) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: Offset(
                            2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                padding: const EdgeInsets.all(8.0),
                child: Container(),
              );
            },
          ),
        ),
      ],
    );
  }


}
