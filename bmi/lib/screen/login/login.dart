import 'package:bmi/const/color.dart';
import 'package:bmi/const/img.dart';
import 'package:bmi/provider/login_provider.dart';
import 'package:bmi/screen/register/select_seller_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../const/dimen.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context)=> LoginProvider(),
      child: Scaffold(
        backgroundColor: white.withOpacity(0.95),
        body: Consumer<LoginProvider>(
          builder: (context,value,child)=>Padding(
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
                   textEditingController: value.phoneController,
                  hintText: "ဖုန်းနံပါတ်ထည့်ပါ",
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
                  obs: true,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,
                  prefixIcon: const Opacity(opacity: 0.5, child: Icon(Icons.lock)),
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // const Align(
                //     alignment: Alignment.bottomRight,
                //     child: Opacity(
                //         opacity: 0.6,
                //         child:
                //             ReusableText(reuseText: "လျှို့ဝှက်နံပါတ်မေ့နေသလား?"))),
                const SizedBox(
                  height: 30,
                ),
                IgnorePointer(
                  ignoring: value.loading,
                  child: ReusableButton(
                    onTap: () async {
                      value.enableLoading();
                      Future.delayed(const Duration(seconds: 2),(){
                        value.doLogin(value.phoneController.text, value.passwordController.text, context);
                      });

                    },
                    width: MediaQuery.of(context).size.width,
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
                      reuseText: "အကောင့်ဝင်မည်",
                      fColor: white,
                    ),
                    text: "",
                    color:value.loading?primary.withOpacity(0.5): primary,
                    textColor: white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Opacity(
                        opacity: 0.6,
                        child: ReusableText(reuseText: "အကောင့်မရှိဘူးလား?")),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SellerTypeScreen()));
                      },
                      child: Opacity(
                          opacity: 0.6,
                          child: ReusableText(
                            reuseText: "အသစ်လုပ်မည်",
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
