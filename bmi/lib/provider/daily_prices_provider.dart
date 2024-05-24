
import 'package:bmi/data/network/data_agent/daily_prices/daily_price_data_agent.dart';
import 'package:bmi/data/network/data_agent/daily_prices/daily_prices_data_agent_impl.dart';
import 'package:bmi/data/network/response_vo/daily_prices_response_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyPricesProvider extends ChangeNotifier {
  DailyPricesDataAgent dailyPricesDataAgent = DailyPricesDataAgentImpl();

  bool loading = false;

  String remarkDate = "",remark="";
  TextEditingController remarkText=TextEditingController();
  List<TodayPrice>? pricesData;
bool showRemark=false;
  String dateShow = "";
  String dayName = "";

  DateTime? selectedDate;

  ///date select
  Future<void> selectDate(BuildContext context) async {
    print("Date select work");
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateShow = selectedDate.toString().split(" ")[0];
      getDailyPrices(dateShow);
      dayName = selectedDate == null
          ? 'No date selected'
          : DateFormat('EEEE').format(selectedDate!);

      notifyListeners();
    }
  }

  showHideRemark(){
    showRemark=!showRemark;
    notifyListeners();
  }

///Constructor
  DailyPricesProvider() {
    if (dateShow == "") {
      dateShow = DateTime.now().toString().split(" ")[0];
      //dateShow="2024-04-12";
      getDailyPrices(dateShow);
      notifyListeners();
    } else {
      getDailyPrices(dateShow);
      notifyListeners();
    }
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
  getDailyPrices(String search) async {
    print("Date select work at api call");
    dailyPricesDataAgent.getDailyPrices(search).then((value) {
      disableLoading();
      if (value.code == 200) {
        pricesData=value.data?.todayPrices;
        remarkDate=value.data?.date.toString().split(" ")[0]??"";
        remark=value.data?.remark??"";
        print("Respond data is here ${value.data?.todayPrices?[0].sellPrice}");
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
