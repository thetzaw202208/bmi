import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/const/dimen.dart';
import 'package:bmi/provider/product_selling_provider.dart';
import 'package:bmi/screen/history/history.dart';
import 'package:bmi/screen/seller_process/select_rice_type.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/color.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.type,
    required this.goodsType,
  });
  final int type;
  final String goodsType;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? sellerType = "";

  bool isAdd = false;
  int? selectedType;


  final ImagePicker picker = ImagePicker();
  List<XFile>? pickedFile;
  int? selectQty;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sellerType = sh.getString("sellerType");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductSellingProvider>(
      create: (context) => ProductSellingProvider(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            iconTheme: const IconThemeData(color: white),
            centerTitle: true,
            title: const ReusableText(
              reuseText: "အရောင်းတင်ရန်",
              fSize: 16,
              fWeight: FontWeight.bold,
              fColor: white,
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: ReusableButton(
              onTap: () {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    title: 'ဝမ်းသာပါတယ်',
                    desc: 'ရောင်းချမှု လုပ်ငန်းစဉ် အောင်မြင်ပါသည်',
                    btnCancelText: "မှတ်တမ်း",
                    btnOkText: "ထပ်ရောင်းမည်",
                    btnOkOnPress: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SelectRiceTypeScreen()),
                          (Route<dynamic> route) => false);
                    },
                    btnCancelOnPress: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HistoryScreen()),
                          (Route<dynamic> route) => false);
                    }).show();
              },
              width: MediaQuery.of(context).size.width,
              text: "အရောင်းတင်မည်",
              color: primary,
              textColor: white,
            ),
          ),
          body: Consumer<ProductSellingProvider>(
            builder: (context, value, _) {
              (widget.goodsType == "အခြား")
                  ? value.riceType.text = ""
                  : value.riceType.text = widget.goodsType;
              return ListView(
                children: [
                  ///Rice Type
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          reuseText: widget.type == 1
                              ? "ဆန်ကွဲအမျိုးအစား"
                              : widget.type == 0
                                  ? "ဆန်အမျိုးအစား"
                                  : "စပါးအမျိုးအစား",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          autoFocus: widget.goodsType == "အခြား" ? true : false,
                          textEditingController: value.riceType,
                          isEnabled: widget.goodsType == "အခြား" ? true : false,
                          hintColor: kHintTextColor,
                          hintText: widget.goodsType == "အခြား" ? "အမျိုးအမည် ရိုက်ထည့်ပါ" : widget.goodsType,
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                        ),
                      ],
                    ),
                  ),

                  ///Rice percent
                  if (widget.type != 2)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                            reuseText: "ဆန်သား %",
                            fWeight: FontWeight.bold,
                          ),
                          ReusableTextField(
                            hintText: "ဆန်သားပမာဏထည့်ပါ",
                            keyboardType: TextInputType.number,
                            borderColor: kLoginBorderColor,
                            borderRadius: kLargeBorderRadius,
                            suffixIcon: Opacity(
                                opacity: 0.5, child: Icon(Icons.percent)),
                          ),
                        ],
                      ),
                    ),

                  ///Broken rice percent
                  if (widget.type != 2)
                    const SizedBox(
                      height: 10,
                    ),
                  if (widget.type != 2)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            reuseText: "ဆန်ကွဲ %",
                            fWeight: FontWeight.bold,
                          ),
                          ReusableTextField(
                            hintText: "ဆန်ကွဲပမာဏထည့်ပါ",
                            keyboardType: TextInputType.number,
                            borderColor: kLoginBorderColor,
                            borderRadius: kLargeBorderRadius,
                            suffixIcon: Opacity(
                                opacity: 0.5, child: Icon(Icons.percent)),
                          ),
                        ],
                      ),
                    ),

                  ///Moisture
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          reuseText: "အစိုဓာတ်",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          keyboardType: TextInputType.number,
                          hintText: "အစိုဓာတ်ပမာဏထည့်ပါ",
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                          suffixIcon:
                              Opacity(opacity: 0.5, child: Icon(Icons.percent)),
                        ),
                      ],
                    ),
                  ),

                  ///Weight
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ReusableText(
                          reuseText: "အလေးချိန်",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          keyboardType: TextInputType.number,
                          hintText: "အလေးချိန်ပမာဏထည့်ပါ",
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 15),
                            child: ReusableText(
                              reuseText: value.measurementList?[selectQty ?? 0].name,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 70,
                    child: GridView.builder(
                        itemCount: value.measurementList?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 3,
                                crossAxisCount: 4),
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectQty = index;
                                });
                              },
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                    // padding: EdgeInsets.symmetric(horizontal: 5),
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: selectQty == index
                                            ? secondary
                                            : white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: ReusableText(
                                        reuseText: value.measurementList?[index].name,
                                        fSize: 12,
                                        fColor:
                                            selectQty == index ? white : black,
                                        fWeight: FontWeight.bold,
                                        overflow: TextOverflow.visible,
                                      ),
                                    )),
                              ),
                            )),
                  ),

                  ///Quantity
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          reuseText: "အိတ်အရေအတွက်",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          hintText: "အိတ်အရေအတွက်ထည့်ပါ",
                          keyboardType: TextInputType.number,
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                        ),
                      ],
                    ),
                  ),

                  ///price
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          reuseText: "စျေးနှုန်း(ကျပ်)",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          hintText: "စျေးနှုန်းထည့်ပါ",
                          keyboardType: TextInputType.number,
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                        ),
                      ],
                    ),
                  ),

                  ///address
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          reuseText: "လိပ်စာ",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          hintText: "လိပ်စာထည့်ပါ",
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                          suffixIcon: Opacity(
                              opacity: 0.5,
                              child: Icon(Icons.location_on_rounded)),
                        ),
                      ],
                    ),
                  ),

                  ///Phone number
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          reuseText: "ဖုန်းနံပါတ်",
                          fWeight: FontWeight.bold,
                        ),
                        ReusableTextField(
                          hintText: "ဖုန်းနံပါတ်ထည့်ပါ  ဥပမာ 09987654321",
                          borderColor: kLoginBorderColor,
                          borderRadius: kLargeBorderRadius,
                          suffixIcon:
                              Opacity(opacity: 0.5, child: Icon(Icons.phone)),
                        ),
                      ],
                    ),
                  ),

                  ///Picture upload
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ReusableText(
                          reuseText: "ပုံ/ဗွီဒီယိုဖိုင်တင်ရန်",
                          fWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            pickedFile = await picker.pickMultiImage();
                            if (pickedFile != null) {}
                            setState(() {});
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: const SizedBox(
                              width: 100,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add_circle),
                                  ReusableText(reuseText: "ပုံရွေးရန်")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (pickedFile != null)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: pickedFile!.length,
                              itemBuilder: (context, index) {
                                return Image.file(
                                  File(pickedFile![index].path),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  ),

                  ///button
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            },
          )),
    );
  }
}
