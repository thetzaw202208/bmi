import 'package:bmi/const/color.dart';
import 'package:bmi/const/img.dart';
import 'package:bmi/screen/home/market_price.dart';
import 'package:bmi/screen/register/select_seller_type.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
            const ReusableTextField(
              hintText: "ဖုန်းနံပါတ်ထည့်ပါ",
              borderColor: kLoginBorderColor,
              borderRadius: kLargeBorderRadius,
              prefixIcon: Opacity(opacity: 0.5, child: Icon(Icons.person)),
            ),
            const SizedBox(
              height: 30,
            ),
            const ReusableTextField(
              hintText: "လျှို့ဝှက်နံပါတ်ထည့်ပါ",
              borderColor: kLoginBorderColor,
              borderRadius: kLargeBorderRadius,
              prefixIcon: Opacity(opacity: 0.5, child: Icon(Icons.lock)),
            ),
            const SizedBox(
              height: 5,
            ),
            const Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                    opacity: 0.6,
                    child:
                        ReusableText(reuseText: "လျှို့ဝှက်နံပါတ်မေ့နေသလား?"))),
            const SizedBox(
              height: 30,
            ),
            ReusableButton(
              onTap: () async {
                if (context.mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MarketPriceScreen()));
                }
              },
              width: MediaQuery.of(context).size.width,
              text: "ဝင်မည်",
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
    );
  }
}
