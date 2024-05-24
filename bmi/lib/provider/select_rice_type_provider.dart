import 'package:bmi/data/network/data_agent/get_product_category/get_product_cat_data_agent.dart';
import 'package:bmi/data/network/data_agent/get_product_category/get_product_cat_data_agent_impl.dart';
import 'package:bmi/data/network/response_vo/get_product_cat_response_vo.dart';
import 'package:bmi/data/network/response_vo/get_product_response_vo.dart';
import 'package:flutter/foundation.dart';

import '../data/network/data_agent/get_product_type/get_product_type_data_agent.dart';
import '../data/network/data_agent/get_product_type/get_product_type_data_agent_impl.dart';

class SelectRiceTypeProvider extends ChangeNotifier {
  String? errorText;
  int? productID;
  int? selectedIndex;
  bool isLoading = false;

  int? selectedProductType;
  List<ProductCatData>? productType;
  ProductTypeData? productTypeByID;
  GetProductCategoryDataAgent getProductCategoryDataAgent =
      GetProductCategoryDataAgentImpl();
  GetProductTypeDataAgent getProductTypeDataAgent =
      GetProductTypeDataAgentImpl();

  SelectRiceTypeProvider() {
    enableLoading();
    getProductType();
    notifyListeners();
  }
  selectRiceType(index) {
    selectedIndex = index;
    productID = productType?[index].id;
    getProductDataByID(productID ?? 1);
    errorText = "";
    notifyListeners();
  }
unselectedRiceType(){
    selectedIndex=null;
    notifyListeners();
}
  selectProductType(index) {
    selectedProductType = index;
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
  onLoading() {
    enableLoading();
    print("Refresh work");

    Future.delayed(const Duration(seconds: 2), () {
      getProductType();
      notifyListeners();
      disableLoading();
    });
  }
  getProductType() {
    getProductCategoryDataAgent.getProductCategory().then((value) {
      if (value.code == 200) {
        disableLoading();
        productType = value.data;
        print("Get product success");
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

  getProductDataByID(int productCatID) {
    getProductTypeDataAgent.getProductType(productCatID).then((value) {
      if (value.code == 200) {
        disableLoading();
        productTypeByID = value.data;
       // print("Here is product list ${productTypeByID?.products?[0].name}");
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
