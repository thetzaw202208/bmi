import 'package:bmi/data/network/response_vo/get_product_cat_response_vo.dart';

abstract class GetProductCategoryDataAgent {
  Future<GetProductCatResponseVo> getProductCategory();
}
