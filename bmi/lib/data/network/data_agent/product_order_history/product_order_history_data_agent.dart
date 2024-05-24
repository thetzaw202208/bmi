
import 'package:bmi/data/network/response_vo/order_history_response_vo.dart';

abstract class OrderHistoryDataAgent {
  Future<OrderHistoryResponseVo> getOrderHistory(int sellerID);
}
