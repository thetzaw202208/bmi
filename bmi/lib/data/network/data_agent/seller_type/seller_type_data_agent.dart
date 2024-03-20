

import 'package:bmi/data/network/response_vo/seller_type_response_vo.dart';

import '../../response_vo/register_response_vo.dart';

abstract class GetSellerTypeDataAgent {
  Future<SellerTypeVo> getSellerType();
}
