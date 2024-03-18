
import 'package:flutter/material.dart';

import '../../../const/color.dart';
import '../../../const/dimen.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ပရိုဖိုင်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(Icons.person,size: 100,),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(reuseText: "အမည်",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(
                  isEnabled: false,
                  hintText: "သက်ဇော်လတ်",
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(reuseText: "ဖုန်းနံပါတ်",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  hintText: "+959987654321",
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            SizedBox(height: 20,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(reuseText: "လိပ်စာ",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  hintText: "လှိုင် မြို့နယ်၊ ၁၃ ရပ်ကွက်",
                  keyboardType: TextInputType.number,
                  borderColor: kLoginBorderColor,
                  borderRadius: kLargeBorderRadius,

                ),
              ],
            ),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}
