import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';

abstract class GetProductTypeDataAgent {
  Future<GetProductResponseVo> getProductType(int productCatID);
}
