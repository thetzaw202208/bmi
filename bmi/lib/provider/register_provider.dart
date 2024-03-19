import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/network/data_agent/register/register_data_agent.dart';
import '../data/network/data_agent/register/register_data_agent_impl.dart';
import '../screen/login/login.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RegisterDataAgent registerDataAgent = RegisterDataAgentImpl();
  bool loading = false;

  enableLoading() {
    loading = true;
    notifyListeners();
  }

  disableLoading() {
    loading = false;
    notifyListeners();
  }

  doRegister(
      String name,
      String phoneNumber,
      String password,
      String address,
      int buyerCategory,
      String shopName,
      String shopAddress,
      BuildContext context) {
    registerDataAgent
        .doRegister(name, phoneNumber, password, address, buyerCategory)
        .then((value) {
      print(
          "request param $name , $phoneNumber $password $address $buyerCategory ${value.data?.password}");
      if (value.code == 200) {
        AwesomeDialog(
            dialogType: DialogType.success,
            context: context,
            desc: "အကောင့်ဖွင့်ခြင်းအောင်မြင်ပါသည်",
            btnOkOnPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
            },
            btnOkText: "အကောင့်ဝင်မည်")
            .show();
        disableLoading();
      } else if (value.code == 400) {
        disableLoading();
        AwesomeDialog(
          dialogType: DialogType.error,
          context: context,
          title: value.message,
          btnOkOnPress: () {},
        ).show();
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
