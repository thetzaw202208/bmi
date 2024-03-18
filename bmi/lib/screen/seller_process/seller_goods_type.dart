import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/screen/seller_process/selling_form.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';

class SellerGoodsType extends StatefulWidget {
  const SellerGoodsType({super.key, required this.type});
  final int type;
  @override
  State<SellerGoodsType> createState() => _SellerGoodsTypeState();
}

class _SellerGoodsTypeState extends State<SellerGoodsType> {
  final riceType = [
    "ရွှေဘိုအိုးဝင်ထိပ်စ(ရှယ်)",
    "မြောင်းမြပေါ်ဆန်း(ရှယ်)",
    "ဒေးဒရဲပေါ်ဆန်း(ရှယ်)",
    "ပုသိမ်ပေါ်ဆန်း(ရှယ်)",
    "ဧရာပဒေသာ(ရှယ်)",
    "ရက်(၉၀)(ရှယ်)",
    "ရတနာတိုး(ရှယ်)",
    "Eleven(ရှယ်)",
    "ဆင်းသုခ(ရှယ်)",
    "ပေါ်ဆန်း(ရှယ်)",
    "နှံကောက်(ရှယ်)",
    "သီးထပ်(ရှယ်)",
    "ကျားပျံ(ရှယ်)",
    "ပခန်း(ရှယ်)",
    "အခြား"
  ];

  final rawRiceType = [
    "EX",
    "1,EX",
    "A12",
    "B12 (Sorted)",
    "B12 (Non-sorted)",
    "B234",
    "အခြား"
  ];
  final sabarType = [
    "ရွှေဘိုအိုးဝင်ထိပ်စ(ရှယ်)",
    "မြောင်းမြပေါ်ဆန်း(ရှယ်)",
    "ဒေးဒရဲပေါ်ဆန်း(ရှယ်)",
    "ပုသိမ်ပေါ်ဆန်း(ရှယ်)",
    "ဧရာပဒေသာ(ရှယ်)",
    "ရက်(၉၀)(ရှယ်)",
    "ရတနာတိုး(ရှယ်)",
    "Eleven(ရှယ်)",
    "ဆင်းသုခ(ရှယ်)",
    "ပေါ်ဆန်း(ရှယ်)",
    "နှံကောက်(ရှယ်)",
    "သီးထပ်(ရှယ်)",
    "ကျားပျံ(ရှယ်)",
    "ပခန်း(ရှယ်)",
    "အခြား"
  ];

  int? selectedType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: primary,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ကုန်ပစ္စည်းရွေးရန်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReusableText(
              reuseText: "ရောင်းချမည့် ကုန်ပစ္စည်းအမျိုးအစား ရွေးချယ်ရန်",
              fSize: 16,
              fWeight: FontWeight.bold,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: widget.type == 0
                      ? riceType.length
                      : widget.type == 1
                          ? rawRiceType.length
                          : sabarType.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedType = index;
                          });
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              // padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 90,
                              decoration: BoxDecoration(
                                  color: selectedType == index ? secondary : white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: ReusableText(
                                  reuseText: widget.type == 0
                                      ? riceType[index]
                                      : widget.type == 1
                                          ? rawRiceType[index]
                                          : sabarType[index],
                                  fSize: 12,
                                  fColor:selectedType == index
                                      ?white: black,
                                  fWeight: FontWeight.bold,
                                  overflow: TextOverflow.visible,
                                ),
                              )),
                        ),
                      )),
            ),
            const SizedBox(
              height: 30,
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ReusableButton(
          onTap: () {
            if ( selectedType != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(

                            type: widget.type,
                            goodsType: widget.type == 0
                                ? riceType[selectedType ?? 0]
                                : widget.type == 1
                                ? rawRiceType[selectedType ?? 0]
                                : sabarType[selectedType ?? 0] ,
                          )));
            } else if ( selectedType == null) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'သတိပြုရန်',
                desc: 'ကျေးဇူးပြု၍ ကုန်ပစ္စည်း အမျိုးအစား ရွေးပေးပါ',
                // btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();
            }
          },
          width: MediaQuery.of(context).size.width,
          text: "ဆက်သွားမည်",
          color: primary,
          textColor: white,
        ),
      ),
    );
  }
}
