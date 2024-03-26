import 'package:bmi/data/network/data_agent/get_product_category/get_product_cat_data_agent.dart';
import 'package:bmi/data/network/data_agent/measurement_list/measurement_list_data_agent.dart';
import 'package:bmi/data/network/response_vo/get_product_cat_response_vo.dart';
import 'package:bmi/data/network/response_vo/measurement_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class GetMeasurementDataAgentImpl extends GetMeasurementDataAgent {
  late ApiService _api;

  static final GetMeasurementDataAgentImpl _singleton =
  GetMeasurementDataAgentImpl._internal();

  factory GetMeasurementDataAgentImpl() {
    return _singleton;
  }

  GetMeasurementDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio, baseUrl: baseURL);
  }

  @override
  Future<MeasurementResponseVo> getMeasurementData() {
   return _api.getMeasurementData();
  }




}
