
import 'package:bmi/data/network/data_agent/seller_type/seller_type_data_agent.dart';
import 'package:bmi/data/network/response_vo/seller_type_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class GetSellerTypeDataAgentImpl extends GetSellerTypeDataAgent {
  late ApiService _api;

  static final GetSellerTypeDataAgentImpl _singleton =
  GetSellerTypeDataAgentImpl._internal();

  factory GetSellerTypeDataAgentImpl() {
    return _singleton;
  }

  GetSellerTypeDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio,baseUrl: baseURL);
  }

  @override
  Future<SellerTypeVo> getSellerType() {
  return _api.getSellerType();

  }



}