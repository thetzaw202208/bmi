import 'package:bmi/data/network/data_agent/get_product_category/get_product_cat_data_agent.dart';
import 'package:bmi/data/network/response_vo/get_product_cat_response_vo.dart';
import 'package:dio/dio.dart';

import '../../../../const/api.dart';
import '../../api/api_service.dart';

class GetProductCategoryDataAgentImpl extends GetProductCategoryDataAgent {
  late ApiService _api;

  static final GetProductCategoryDataAgentImpl _singleton =
  GetProductCategoryDataAgentImpl._internal();

  factory GetProductCategoryDataAgentImpl() {
    return _singleton;
  }

  GetProductCategoryDataAgentImpl._internal() {
    final dio = Dio(BaseOptions(headers: <String, String>{
      'Content-Type': contentType,
      'Authorization': "Bearer $authorizationToken"
    }));
    _api = ApiService(dio, baseUrl: baseURL);
  }

  @override
  Future<GetProductCatResponseVo> getProductCategory() {
   return _api.getProductCat();
  }


}
