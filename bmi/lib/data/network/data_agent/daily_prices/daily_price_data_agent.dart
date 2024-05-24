import 'package:bmi/data/network/response_vo/daily_prices_response_vo.dart';

abstract class DailyPricesDataAgent {
  Future<DailyPricesResponseVo> getDailyPrices(String date);
}
