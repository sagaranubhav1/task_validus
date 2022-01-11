import 'package:validus_coin/data/models/stock_data.dart';

class ApiResultModel {
  List<StockData> stockDataList;
  bool status;

  ApiResultModel({this.stockDataList, this.status});

  factory ApiResultModel.fromJson(Map<String, dynamic> json) {
    return ApiResultModel(
      stockDataList: json['data'] != null
          ? (json['data'] as List)
          .map((i) => StockData.fromJson(i))
          .toList()
          : null,
      status: json['status'],
    );
  }
}
