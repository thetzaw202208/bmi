


import 'package:bmi/data/network/data_agent/product_order_history/product_order_history_data_agent.dart';
import 'package:bmi/data/network/data_agent/product_order_history/product_order_history_data_agent_impl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/response_vo/order_history_response_vo.dart';

class OrderHistoryProvider extends ChangeNotifier {
  OrderHistoryDataAgent orderHistoryDataAgent = ProductOrderHistoryDataAgentImpl();

  bool loading = false;
  List<OrderData>? orderHistoryList;
  int sellerID=1;
  ///Constructor
  OrderHistoryProvider() {
   getSellerID();
  }
getSellerID(){
    enableLoading();
    Future.delayed(Duration(seconds: 2),() async {
      SharedPreferences sh=await SharedPreferences.getInstance();
      sellerID=sh.getInt("seller_id")??1;
      getOrderHistoryList(sellerID);
    });

}

  void showImagePreview(BuildContext context,String url) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Image.network(
            url, // Replace with your image URL
          ),
        );
      },
    );
  }
  ///loading enable
  enableLoading() {
    loading = true;
    notifyListeners();
  }
  ///loading disable
  disableLoading() {
    loading = false;
    notifyListeners();
  }
  ///getDaily prices method
  getOrderHistoryList(int sellerID) async {
    print("Date select work at api call");
    orderHistoryDataAgent.getOrderHistory(sellerID).then((value) {
      disableLoading();
      if (value.code == 200) {
       orderHistoryList=value.data;
        notifyListeners();
        disableLoading();
      } else if (value.code == 422) {
        disableLoading();
        // AwesomeDialog(
        //   dialogType: DialogType.error,
        //   context: context,
        //   desc: "အကောင့်အချက်အလက် မှားယွင်းနေပါသည်",
        //   btnOkOnPress: () {},
        // ).show();
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
