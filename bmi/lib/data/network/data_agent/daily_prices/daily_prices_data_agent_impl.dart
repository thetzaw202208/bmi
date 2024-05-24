import 'package:bmi/data/network/data_agent/daily_prices/daily_price_data_agent.dart';
import 'package:bmi/data/network/data_agent/get_product_type/get_product_type_data_agent.dart';
import 'package:bmi/data/network/response_vo/daily_prices_response_vo.dart';
import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class DailyPricesDataAgentImpl extends DailyPricesDataAgent {
  late ApiService _api;

  static final DailyPricesDataAgentImpl _singleton =
  DailyPricesDataAgentImpl._internal();

  factory DailyPricesDataAgentImpl() {
    return _singleton;
  }

  DailyPricesDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio, baseUrl: baseURL);
  }

  @override
  Future<DailyPricesResponseVo> getDailyPrices(String date) {
    return _api.dailyPrices(date);
  }


}
