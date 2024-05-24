
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController sellerTypeName=TextEditingController();
  TextEditingController buyer=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name.text = sharedPreferences.getString("name") ?? "";
    phone.text = sharedPreferences.getString("phone") ?? "";
    address.text = sharedPreferences.getString("address") ?? "";
    sellerTypeName.text = sharedPreferences.getString("seller_type_name") ?? "";
    var buyerType = sharedPreferences.getInt("buyer_id");
    if(buyerType==1){
      buyer.text="လက်လီ";
    }
    else{
      buyer.text="လက်ကား";
    }
    print("Profile Data $name $phone $address");
    setState(() {

    });
  }

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
      body:  Padding(
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
                  textEditingController:name,
                  isEnabled: false,
                  hintText: "အမည်",
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
                  textEditingController: phone,
                  hintText: "ဖုန်းနံပါတ်",
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
                ReusableText(reuseText: "Type",fWeight: FontWeight.bold,fSize: 16,),
                ReusableTextField(isEnabled: false,
                  textEditingController: sellerTypeName,
                  hintText: "",

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
                  textEditingController: address,
                  hintText: "လိပ်စာ",
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
