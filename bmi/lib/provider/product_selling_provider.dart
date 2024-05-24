import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/data/network/data_agent/measurement_list/measurement_list_data_agent.dart';
import 'package:bmi/data/network/response_vo/measurement_response_vo.dart';
import 'package:bmi/data/static_data/export_model.dart';
import 'package:bmi/screen/home/daily_prices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/color.dart';
import '../data/network/data_agent/measurement_list/measurement_list_data_agent_impl.dart';
import '../data/network/data_agent/product_order/product_order_data_agent.dart';
import '../data/network/data_agent/product_order/product_order_data_agent_impl.dart';
import '../screen/history/history.dart';

class ProductSellingProvider extends ChangeNotifier {
  int? sellerID;
  int? selectQty = 0;
  int? selectPriceType;
  int? selectExportType;
  int? showExportID;
  int? showPriceID;
  List<String> photos = [];
  List<XFile> pickedFile = [];
  List<String>? fileType;
  String photo = "";
  bool loading = false;
  List<ExportOrLocal> exportList = [
    ExportOrLocal(1, "Raw"),
    ExportOrLocal(2, "RC")
  ];
  TextEditingController riceType = TextEditingController();
  TextEditingController ricePercent = TextEditingController();
  TextEditingController brokenRicePercent = TextEditingController();
  TextEditingController moisturePercent = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController weight = TextEditingController();
  List<MeasurementData>? measurementList = [];
  // GetMeasurementDataAgent getMeasurementDataAgent =
  //     GetMeasurementDataAgentImpl();
  ProductOrderDataAgent productOrderDataAgent = ProductOrderDataAgentImpl();
  ProductSellingProvider() {
    //getMeasurement();
    notifyListeners();
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

  selectIndex(int index) {
    selectQty = index;
    notifyListeners();
  }

  pickImage(ImagePicker imagePicker) async {
    pickedFile = await imagePicker.pickMultipleMedia();
    notifyListeners();
  }

  getFileType(List<XFile> file) {
    for (var i = 0; i < file.length; i++) {
      var fType = file[i].name.split(".")[1];
      fileType?.add(fType);
    }

    notifyListeners();
  }

  selectPriceTypeFun(int index, int id) {
    selectPriceType = index;
    showPriceID = id;
    notifyListeners();
  }

  selectExportTypeFun(int index, int id) {
    selectExportType = index;
    showExportID = id;
    notifyListeners();
  }

  productSellingOrder(
      int? productCatID,
      int? sellerProductTypeID,
      String productName,
      String orderDate,
      int? ricePercent,
      int? brokenRicePercent,
      int? moisturePercent,
      String weight,
      int? measurementId,
      int quantity,
      int price,
      String address,
      int? categoryPriceID,
      List<String> photo,
      String? remark,
      String phone,
      BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sellerID = sharedPreferences.getInt("seller_id") ?? 1;
    print(
        "$productCatID,$sellerProductTypeID,$productName,$orderDate,$ricePercent,$brokenRicePercent,$moisturePercent,$weight,$measurementId,$quantity,$price,  $address,$categoryPriceID, $remark,$showExportID $photo,");
    print(
        "Here is requ param sellerId: $sellerID export: $showExportID remark: $remark  productCatID: $productCatID, sellerProductID: $sellerProductTypeID,productName: $productName,orderDate: $orderDate, riceOne: $ricePercent,riceTwo: $brokenRicePercent,moisture: $moisturePercent,weight: $weight,measure: $measurementId,quantity: $quantity,price: $price,address: $address,catPriceID: $categoryPriceID,photo: $photo");
    productOrderDataAgent
        .productOrder(
            sellerID ?? 1,
            productCatID,
            sellerProductTypeID,
            productName,
            orderDate,
            ricePercent,
            brokenRicePercent,
            moisturePercent,
            weight,
            measurementId,
            quantity,
            price,
            address,
            categoryPriceID,
            showExportID,
            remark,
            phone,
            photo)
        .then((value) {
      if (value.code == 200) {
        disableLoading();
        print("Success ${value.code}");
        print(value.data);
        AwesomeDialog(
            btnOkColor: primary,
            dialogType: DialogType.success,
            context: context,
            desc: "အော်ဒါတင်ခြင်း လုပ်ငန်းစဉ် အောင်မြင်ပါသည်",
            btnCancelText: "မှတ်တမ်းကြည့်မည်",
            btnOkText: "မူလစာမျက်နှာသို့",
            btnOkOnPress: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const MarketPriceScreen()),
                  (Route<dynamic> route) => false);
            },
            btnCancelOnPress: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen()),
                  (Route<dynamic> route) => false);
            }).show();
      }
    });

    notifyListeners();
  }

  // getMeasurement() {
  //   getMeasurementDataAgent.getMeasurementData().then((value) {
  //     if (value.code == 200) {
  //       measurementList = value.data;
  //       notifyListeners();
  //     } else {
  //       notifyListeners();
  //     }
  //   });
  // }
}
