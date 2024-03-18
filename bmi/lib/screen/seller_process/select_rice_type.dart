import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/screen/home/market_price.dart';
import 'package:bmi/screen/seller_process/seller_goods_type.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/dimen.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
class Type{
  String img;
  String text;

  Type(this.img, this.text);
}
class SelectRiceTypeScreen extends StatefulWidget {
  const SelectRiceTypeScreen({super.key});

  @override
  State<SelectRiceTypeScreen> createState() => _SelectRiceTypeScreenState();
}

class _SelectRiceTypeScreenState extends State<SelectRiceTypeScreen> {

  List<Type> type=[
    Type("assets/images/rice.png", "ဆန်"),
    Type("assets/images/broken_rice.png", "ဆန်ကွဲ"),
    Type("assets/images/raw_rice.png", "စပါး"),
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MarketPriceScreen()),
                    (Route<dynamic> route) => false);
          },
        ),
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ရောင်းချမည်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ReusableText(
                reuseText: "ရောင်းမည့် အမျိုးအစား ရွေးချယ်ပါ",
                fColor: white,
                fWeight: FontWeight.bold,
                fSize: kFontSize16,
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: type.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1
              ), itemBuilder: (context,index)=>GestureDetector(

                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  child: Container(
                    width: 100,
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: selectedIndex == index ? secondary : black.withOpacity(0.1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                          child: Image.asset(
                            type[index].img

                          ),
                        ),
                        ReusableText(
                          reuseText: type[index].text,
                          fWeight: FontWeight.bold,
                          fSize: 14,

                          fColor:selectedIndex == index
                              ? white:black,
                        ),
                      ],
                    ),
                  ))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

        ],
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: ReusableButton(
          onTap: (){
            if(selectedIndex!=null){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SellerGoodsType(type: selectedIndex??0)));
            }
            else{
              if(context.mounted) {
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
            }

          },
          width: MediaQuery.of(context)
              .size
              .width,
          text: "ဆက်သွားမည်",color: primary,textColor: white,),
      ),
    );
  }
}
