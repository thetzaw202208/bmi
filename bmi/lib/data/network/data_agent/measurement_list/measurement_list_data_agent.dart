
import 'package:bmi/data/network/response_vo/measurement_response_vo.dart';

abstract class GetMeasurementDataAgent {
  Future<MeasurementResponseVo> getMeasurementData();
}
