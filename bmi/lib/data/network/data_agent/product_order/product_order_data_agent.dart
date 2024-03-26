import 'package:bmi/data/network/response_vo/product_selling_order_response_vo.dart';

abstract class ProductOrderDataAgent {
  Future<ProductSellOrderResponseVo> productOrder(
    int productCatID,
    String sellerProductTypeID,
    String productName,
    String orderDate,
    int ricePercentOne,
    int ricePercentTwo,
    String weight,
    int measurementId,
    int totalAmount,
    int price,
    String address,
    String photo,
  );
}
