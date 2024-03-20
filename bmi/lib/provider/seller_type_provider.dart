import 'package:bmi/data/network/response_vo/seller_type_response_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/network/data_agent/seller_type/seller_type_data_agent.dart';
import '../data/network/data_agent/seller_type/seller_type_data_agent_impl.dart';

class SellerTypeProvider extends ChangeNotifier{

  int? sellerID;
  List<int> selectedType = [];
  int? selectedIndex;
  List<SellerTypeData>? sellerType;
  GetSellerTypeDataAgent getSellerTypeDataAgent=GetSellerTypeDataAgentImpl();

  SellerTypeProvider(){
    getSellerTypeDataAgent.getSellerType().then((value) {
      if(value.code==200){
        sellerType=value.data;
      }else if(value.code==400){

      }else if(value.code==422){

      }
    });
  }
}