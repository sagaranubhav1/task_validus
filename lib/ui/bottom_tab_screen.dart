import 'package:flutter/material.dart';
import 'package:validus_coin/data/models/api_result_model.dart';
import 'package:validus_coin/res/app_colors.dart';
import 'package:validus_coin/ui/profile_screen.dart';
import 'package:validus_coin/ui/stock_screen.dart';

class TabsScreen extends StatefulWidget {

   ApiResultModel apiResultModel;

  TabsScreen(this.apiResultModel, {Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedPageIndex==0?StockScreen(apiResultModel:widget.apiResultModel):ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Color(appColors.appBackGroundColor),
        unselectedItemColor: Color(appColors.grey),
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(appColors.appBackGroundColor),
            icon: selectedPageIndex==0?Image.asset("assets/images/selected_stock.png"):Image.asset("assets/images/unselected_stock.png"),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(appColors.appBackGroundColor),
            icon: selectedPageIndex==0?Image.asset("assets/images/unselected_home.png"):Image.asset("assets/images/selected_home.png"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
