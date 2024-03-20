import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/const/color.dart';
import 'package:bmi/const/dimen.dart';
import 'package:bmi/provider/seller_type_provider.dart';
import 'package:bmi/screen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/img.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
class SellerType{
  String type;
  String imgUrl;

  SellerType(this.type, this.imgUrl);
}
class SellerTypeScreen extends StatefulWidget {
  const SellerTypeScreen({super.key});

  @override
  State<SellerTypeScreen> createState() => _SellerTypeScreenState();
}

class _SellerTypeScreenState extends State<SellerTypeScreen> {



  String? errorText;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SellerTypeProvider>(
      create: (context)=>SellerTypeProvider(),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ReusableText(
                reuseText: "သင်က ဘယ်အမျိုးအစားလဲ ရွေးချယ်ပါ",
                fColor: white,
                fWeight: FontWeight.bold,
                fSize: kFontSize18,
              )),
        ),
        body: Consumer<SellerTypeProvider>(
          builder: (context,value,child)
          {

            return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      itemCount: value.sellerType?.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.1,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var id=value.sellerType?[index].id;
                        return GestureDetector(
                          onTap: () {
                            value.selectedIndex = index;
                            errorText = "";
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: value.selectedIndex == index
                                    ? secondary
                                    : black.withOpacity(0.1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 5),
                                  child: Image.asset(
                                    id == 1
                                        ? millImg
                                        :id==2?traderSanImg:id==3?storeImg:id==4?farmImg:id==5?traderSaparImg:millOwnerImg,

                                  ),
                                ),
                                ReusableText(
                                  reuseText: value.sellerType?[index].name,
                                  fWeight: FontWeight.bold,
                                  fSize: kFontSize13,
                                  fColor: value.selectedIndex == index
                                      ? white : black,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // if (errorText != "")
              Center(
                  child: ReusableText(
                    reuseText: errorText,
                    fColor: Colors.red,
                  )),
              const SizedBox(
                height: 30,
              ),
            ],
          );},
        ),
        bottomNavigationBar: Consumer<SellerTypeProvider>(
          builder: (context,value,child)
         {return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: ReusableButton(
              onTap: () async {
                SharedPreferences sh = await SharedPreferences.getInstance();

                if (value.selectedIndex != null) {

                    sh.setString("sellerType", value.sellerType?[value.selectedIndex ?? 0].name??"");

                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  RegisterScreen(sellerID: value.sellerType?[value.selectedIndex ?? 0].id??1,)));
                  }
                } else {

                  if (context.mounted) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'သတိပြုရန်',
                      desc: 'ကျေးဇူးပြု၍ တစ်ခုရွေးပေးပါ',
                      // btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
                  }
                  // errorText = "ကျေးဇူးပြု၍ အနည်းဆုံး တစ်ခုရွေးပေးပါ";
                }
              },
              width: MediaQuery.of(context).size.width,
              text: "ဆက်သွားမည်",
              color: primary,
              textColor: white,
            ),
          );},
        ),
      ),
    );
  }
}
