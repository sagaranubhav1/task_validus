import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validus_coin/data/models/api_result_model.dart';
import 'package:validus_coin/data/models/stock_data.dart';
import 'package:validus_coin/res/app_colors.dart';
import 'package:validus_coin/res/strings.dart';

class StockScreen extends StatefulWidget {

  ApiResultModel apiResultModel;

  StockScreen({this.apiResultModel, Key key}) : super(key: key);

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(appColors.appBackGroundColor),
      child: Container(
        margin: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            const SizedBox(height: 40,),
             Text(
              AppStrings.myWatchList,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                color:Colors.white
              ),
            ),
            Expanded(child: buildImageView())
          ],
        ),
      ),
    );
  }

  Widget buildImageView() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.apiResultModel.stockDataList.length,
            itemBuilder: (BuildContext context, int pos) {
              return Container(
                margin: const EdgeInsets.only(top: 10.0,bottom: 10),
                decoration: BoxDecoration(
                  color: Color(appColors.cardColor),
                  shape: BoxShape.rectangle,
                  boxShadow:  [
                    BoxShadow(
                      color: Color(appColors.cardColor),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                          2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.apiResultModel.stockDataList[pos].stockName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    buildRow(AppStrings.price,widget.apiResultModel.stockDataList[pos].price.toString()),
                    const SizedBox(height: 5,),
                    buildRow(AppStrings.dayGain,widget.apiResultModel.stockDataList[pos].dayGain.toString()),
                    const SizedBox(height: 5,),
                    buildRow(AppStrings.lastTrade,widget.apiResultModel.stockDataList[pos].lastTrade.toString()),
                    const SizedBox(height: 5,),
                    buildRow(AppStrings.extendedHours,widget.apiResultModel.stockDataList[pos].extendedHours),
                    const SizedBox(height: 5,),
                    buildRow(AppStrings.percentChange,widget.apiResultModel.stockDataList[pos].lastTrade),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildRow(String heading, String details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontSize: 13.0,
            color: Colors.white,
            fontWeight: FontWeight.w200
          ),
        ),
        Text(
          details,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
              fontWeight: FontWeight.w300
          ),
        ),
      ],
    );
  }

}