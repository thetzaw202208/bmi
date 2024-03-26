import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/data/network/response_vo/seller_type_response_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/network/data_agent/seller_type/seller_type_data_agent.dart';
import '../data/network/data_agent/seller_type/seller_type_data_agent_impl.dart';

class SellerTypeProvider extends ChangeNotifier {
  String? errorText;
  int? sellerID;
  List<int> selectedType = [];
  int? selectedIndex;
  bool isLoading = false;
  List<SellerTypeData>? sellerType;
  GetSellerTypeDataAgent getSellerTypeDataAgent = GetSellerTypeDataAgentImpl();

  SellerTypeProvider() {
    enableLoading();
    getSellerType();
    notifyListeners();
  }
  selectSellerType(index) {
    selectedIndex = index;
    errorText = "";
    notifyListeners();
  }

  void enableLoading() {
    isLoading = true;
    notifyListeners();
  }

  void disableLoading() {
    isLoading = false;
    notifyListeners();
  }

  getSellerType() {

    getSellerTypeDataAgent.getSellerType().then((value) {
      if (value.code == 200) {
        disableLoading();
        sellerType = value.data;
        notifyListeners();
      } else if (value.code == 400) {
        disableLoading();

        notifyListeners();
      } else if (value.code == 422) {
        disableLoading();
        notifyListeners();
      }
    });
  }
}
