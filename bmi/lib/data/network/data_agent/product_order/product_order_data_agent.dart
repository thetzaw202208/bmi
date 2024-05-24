import 'package:bmi/data/network/response_vo/product_selling_order_response_vo.dart';

abstract class ProductOrderDataAgent {
  Future<ProductSellOrderResponseVo> productOrder(
    int sellerID,
    int? productCatID,
    int? sellerProductTypeID,
    String productName,
    String orderDate,
    int? ricePercentOne,
    int? ricePercentTwo,
    int? moisture,
    String weight,
    int? measurementId,
    int totalAmount,
    int price,
    String address,
    int? categoryID,
    int? exportOrLocal,
    String? remark,
    String phoneNo,
    List<String> photo,
  );
}
