import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:validus_coin/data/models/api_result_model.dart';
import 'package:validus_coin/res/strings.dart';

abstract class HomeRepository {
  Future<ApiResultModel> getApiData();
}

class HomeRepositoryImpl implements HomeRepository {

  @override
  Future<ApiResultModel> getApiData() async {
    var response = await http.get(AppStrings.url);
    if (response.statusCode == 200) {
      var _childDetailsResponse = json.decode(response.body);
      print(_childDetailsResponse);
      return ApiResultModel.fromJson(_childDetailsResponse);
    } else {
      throw Exception();
    }
  }

}
