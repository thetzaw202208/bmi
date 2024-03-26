import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/const/color.dart';
import 'package:bmi/const/img.dart';
import 'package:bmi/provider/register_provider.dart';
import 'package:bmi/screen/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/dimen.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.sellerID});
  final int sellerID;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (context) => RegisterProvider(),
      child: Consumer<RegisterProvider>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: white.withOpacity(0.95),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Image.asset(
                  bmiLogo,
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  hintText: "နာမည်ထည့်ပါ",
                  textEditingController: value.nameController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  hintText: "ဖုန်းနံပါတ်ထည့်ပါ",
                  textEditingController: value.phoneController,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Opacity(opacity: 0.5, child: Icon(Icons.phone)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableText(
                          reuseText: "09",
                          fSize: 16,
                          fWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  textEditingController: value.passwordController,
                  hintText: "လျှို့ဝှက်နံပါတ်ထည့်ပါ",
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon:
                      const Opacity(opacity: 0.5, child: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableTextField(
                  textEditingController: value.addressController,
                  hintText: "လိပ်စာထည့်ပါ",
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon: const Opacity(
                      opacity: 0.5, child: Icon(Icons.location_on_rounded)),
                ),
                const SizedBox(
                  height: 30,
                ),
                ReusableButton(
                  onTap: () async {
                    if (value.nameController.text.isNotEmpty &&
                        value.phoneController.text.isNotEmpty &&
                        value.passwordController.text.isNotEmpty &&
                        value.addressController.text.isNotEmpty) {
                      if (value.passwordController.text.length < 6) {
                        AwesomeDialog(
                          dialogType: DialogType.warning,
                          context: context,
                          btnOkText: "အိုကေ",
                          desc: "လျှို့ဝှက်နံပါတ် အနည်းဆုံး ၆ လုံးရှိရပါမည်",
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        value.enableLoading();
                        value.doRegister(
                            value.nameController.text,
                            value.phoneController.text,
                            value.passwordController.text,
                            value.addressController.text,
                            sellerID,
                            context);
                        if (kDebugMode) {
                          print("Here is seller type $sellerID");
                        }
                      }
                    } else {
                      AwesomeDialog(
                        dialogType: DialogType.warning,
                        context: context,
                        btnOkText: "အိုကေ",
                        desc: "အချက်အလက်များ ပြည့်စုံစွာဖြည့်သွင်းပါ",
                        btnOkOnPress: () {},
                      ).show();
                    }

                    // if(context.mounted) {
                    //
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    //
                    // }
                  },
                  widget: value.loading
                      ? const Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: white,
                        )),
                  )
                      : const ReusableText(
                    reuseText: "အကောင့်လုပ်မည်",
                    fColor: white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  text: "",
                  color: primary,
                  textColor: white,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Opacity(
                        opacity: 0.6,
                        child: ReusableText(reuseText: "အကောင့်ရှိလား?")),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (context.mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                      },
                      child: Opacity(
                          opacity: 0.6,
                          child: ReusableText(
                            reuseText: "ဝင်မည်",
                            fColor: primary.withOpacity(1),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
