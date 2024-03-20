
import 'package:bmi/data/network/data_agent/register/register_data_agent.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';
import '../../response_vo/register_response_vo.dart';

class RegisterDataAgentImpl extends RegisterDataAgent {
  late ApiService _api;

  static final RegisterDataAgentImpl _singleton =
  RegisterDataAgentImpl._internal();

  factory RegisterDataAgentImpl() {
    return _singleton;
  }

  RegisterDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio,baseUrl: baseURL);
  }

  @override
  Future<RegisterVo> doRegister(String name, String phoneNumber, String password, String address, int sellerID) {
    return _api.doRegister(name, phoneNumber, password, address, sellerID);
  }


}