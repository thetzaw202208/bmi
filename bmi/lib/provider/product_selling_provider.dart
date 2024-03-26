import 'package:bmi/data/network/data_agent/measurement_list/measurement_list_data_agent.dart';
import 'package:bmi/data/network/response_vo/measurement_response_vo.dart';
import 'package:flutter/material.dart';

import '../data/network/data_agent/measurement_list/measurement_list_data_agent_impl.dart';

class ProductSellingProvider extends ChangeNotifier {
  TextEditingController riceType = TextEditingController();
List<MeasurementData>? measurementList=[];
  GetMeasurementDataAgent getMeasurementDataAgent =
      GetMeasurementDataAgentImpl();
  ProductSellingProvider() {
    getMeasurement();
    notifyListeners();
  }
  productSellingOrder() {}

  getMeasurement() {
    getMeasurementDataAgent.getMeasurementData().then((value) {
      if (value.code == 200) {
        measurementList=value.data;
        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }
}
