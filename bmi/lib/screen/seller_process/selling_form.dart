import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/const/dimen.dart';
import 'package:bmi/const/font_size_ext.dart';
import 'package:bmi/provider/product_selling_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/color.dart';
import '../../data/network/response_vo/get_product_response_vo.dart';
import '../../provider/select_rice_type_provider.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.catID,
    required this.productID,
    required this.productName,
    required this.productTypeData,
  });
  final int catID;
  final int? productID;
  final String productName;
  final ProductTypeData? productTypeData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? sellerType = "";

  bool isAdd = false;
  int? selectedType;

  final ImagePicker picker = ImagePicker();

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
    print("Here is selling select ID ${widget.catID}");
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
        body: Consumer<ProductSellingProvider>(
          builder: (context, value, _) {
            if (widget.productName != "အခြား") {
              value.riceType.text = widget.productName;
            }
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
                      const ReusableText(
                        reuseText: "အမျိုးအစား", // reuseText: widget.catID == 1
                        //     ? "ဆန်ကွဲအမျိုးအစား"
                        //     : widget.catID == 0
                        //         ? "ဆန်အမျိုးအစား"
                        //         : "စပါးအမျိုးအစား",
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        onChanged: (text) {
                          value.riceType.text = text;
                        },
                        // autoFocus: widget.productName == "အခြား" ? true : false,
                        textEditingController: value.riceType,
                        isEnabled: widget.productName == "အခြား" ? true : false,
                        hintColor: kHintTextColor,
                        hintText: widget.productName == "အခြား"
                            ? "အမျိုးအမည် ရိုက်ထည့်ပါ"
                            : widget.productName,
                        borderColor: kLoginBorderColor,
                        borderRadius: kLargeBorderRadius,
                      ),
                    ],
                  ),
                ),

                ///Rice percent

                Consumer<SelectRiceTypeProvider>(
                    builder: (context, priceData, _) => (priceData
                                .productTypeByID
                                ?.advanced?[0]
                                .hasRicePercentage ==
                            "1")
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ReusableText(
                                  reuseText: "ဆန်သား %",
                                  fWeight: FontWeight.bold,
                                ),
                                ReusableTextField(
                                  textEditingController: value.ricePercent,
                                  hintText: "ဆန်သားပမာဏထည့်ပါ",
                                  keyboardType: TextInputType.number,
                                  borderColor: kLoginBorderColor,
                                  borderRadius: kLargeBorderRadius,
                                  suffixIcon: const Opacity(
                                      opacity: 0.5, child: Icon(Icons.percent)),
                                ),
                              ],
                            ),
                          )
                        : Container()),

                ///Broken rice percent
                if (widget.catID == 1)
                  const SizedBox(
                    height: 10,
                  ),
                Consumer<SelectRiceTypeProvider>(
                    builder: (context, priceData, _) => (priceData
                                .productTypeByID
                                ?.advanced?[0]
                                .hasRicePercentage ==
                            "1")
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ReusableText(
                                  reuseText: "ဆန်ကွဲ %",
                                  fWeight: FontWeight.bold,
                                ),
                                ReusableTextField(
                                  textEditingController:
                                      value.brokenRicePercent,
                                  hintText: "ဆန်ကွဲပမာဏထည့်ပါ",
                                  keyboardType: TextInputType.number,
                                  borderColor: kLoginBorderColor,
                                  borderRadius: kLargeBorderRadius,
                                  suffixIcon: const Opacity(
                                      opacity: 0.5, child: Icon(Icons.percent)),
                                ),
                              ],
                            ),
                          )
                        : Container()),

                ///Moisture
                const SizedBox(
                  height: 10,
                ),
                Consumer<SelectRiceTypeProvider>(
                    builder: (context, priceData, _) => (priceData
                                .productTypeByID?.advanced?[0].hasMoisture ==
                            "1")
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ReusableText(
                                  reuseText: "အစိုဓာတ်",
                                  fWeight: FontWeight.bold,
                                ),
                                ReusableTextField(
                                  keyboardType: TextInputType.number,
                                  textEditingController: value.moisturePercent,
                                  hintText: "အစိုဓာတ်ပမာဏထည့်ပါ",
                                  borderColor: kLoginBorderColor,
                                  borderRadius: kLargeBorderRadius,
                                  suffixIcon: const Opacity(
                                      opacity: 0.5, child: Icon(Icons.percent)),
                                ),
                              ],
                            ),
                          )
                        : Container()),

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
                      ReusableText(
                        reuseText:
                            widget.productTypeData?.advanced?[0].weightLabel,
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        keyboardType: TextInputType.number,
                        textEditingController: value.weight,
                        hintText: "အလေးချိန်ပမာဏထည့်ပါ",
                        borderColor: kLoginBorderColor,
                        borderRadius: kLargeBorderRadius,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 15),
                          child: ReusableText(
                            reuseText: widget.productTypeData
                                ?.measurements?[value.selectQty ?? 0].name,
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
                      itemCount: widget.productTypeData?.measurements?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3,
                              crossAxisCount: 4),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              value.selectIndex(index);
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                  // padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 90,
                                  decoration: BoxDecoration(
                                      color: value.selectQty == index
                                          ? blueWithOpacity
                                          : white,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: ReusableText(
                                      reuseText: widget.productTypeData
                                          ?.measurements?[index].name,
                                      fSize: 12,
                                      fColor: value.selectQty == index
                                          ? white
                                          : black,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        reuseText:
                            widget.productTypeData?.advanced?[0].totalLabel,
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        textEditingController: value.quantity,
                        hintText: "အရေအတွက်ထည့်ပါ",
                        keyboardType: TextInputType.number,
                        borderColor: kLoginBorderColor,
                        borderRadius: kLargeBorderRadius,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///Raw RC
                Consumer<SelectRiceTypeProvider>(
                  builder: (context, priceData, _) => (priceData
                              .productTypeByID?.advanced?[0].hasExport ==
                          "1")
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 100,
                          child: GridView.builder(
                              itemCount: value.exportList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 7,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 5,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      value.selectExportTypeFun(
                                          index, value.exportList[index].id);
                                    },
                                    child: Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 5),
                                          height: 90,
                                          decoration: BoxDecoration(
                                              color: value.selectExportType ==
                                                      index
                                                  ? blueWithOpacity
                                                  : white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                            child: ReusableText(
                                              reuseText:
                                                  value.exportList[index].name,
                                              fSize: 12,
                                              fColor: value.selectExportType ==
                                                      index
                                                  ? white
                                                  : black,
                                              fWeight: FontWeight.bold,
                                              overflow: TextOverflow.visible,
                                            ),
                                          )),
                                    ),
                                  )),
                        )
                      : Container(),
                ),

                ///price
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        reuseText:
                            widget.productTypeData?.advanced?[0].priceLabel,
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        textEditingController: value.price,
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
                const SizedBox(
                  height: 10,
                ),
                Consumer<SelectRiceTypeProvider>(
                  builder: (context, priceData, _) => (priceData
                              .productTypeByID?.categoryPricess?.isNotEmpty ==
                          true)
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 100,
                          child: GridView.builder(
                              itemCount: priceData
                                  .productTypeByID?.categoryPricess?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 7,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 4,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      value.selectPriceTypeFun(
                                          index,
                                          priceData
                                                  .productTypeByID
                                                  ?.categoryPricess?[index]
                                                  .id ??
                                              1);
                                    },
                                    child: Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 5),
                                          height: 90,
                                          decoration: BoxDecoration(
                                              color:
                                                  value.selectPriceType == index
                                                      ? blueWithOpacity
                                                      : white,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            height: 60,
                                            child: Center(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                "${priceData.productTypeByID?.categoryPricess?[index].name}",
                                                style: TextStyle(
                                                  fontSize: context.calculateFontSize(),
                                                  color:
                                                      value.selectPriceType ==
                                                              index
                                                          ? white
                                                          : black,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  )),
                        )
                      : Container(),
                ),

                ///Quantity
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
                        reuseText: "ရောင်းချသူ၏ လိပ်စာ အသေးစိတ်",
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        hintText: "လိပ်စာထည့်ပါ",
                        textEditingController: value.address,
                        borderColor: kLoginBorderColor,
                        borderRadius: kLargeBorderRadius,
                        suffixIcon: const Opacity(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ReusableText(
                        reuseText: "ဖုန်းနံပါတ်",
                        fWeight: FontWeight.bold,
                      ),
                      ReusableTextField(
                        hintText: "ဖုန်းနံပါတ်ထည့်ပါ  ဥပမာ 09987654321",
                        textEditingController: value.phone,
                        keyboardType: TextInputType.phone,
                        borderColor: kLoginBorderColor,
                        borderRadius: kLargeBorderRadius,
                        suffixIcon: const Opacity(
                            opacity: 0.5, child: Icon(Icons.phone)),
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
                        reuseText: "ပုံ တင်ရန်",
                        fWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          value.pickedFile = await picker.pickMultiImage();
                          int maxSizeInBytes = 10 * 1024 * 1024; // 10 MB as an example
                          //value.pickImage(picker);
                          String photoString = "";
                          //var pickedSingleFile = await picker.pickImage(source: ImageSource.gallery);
                          for (var i = 0; i < value.pickedFile.length; i++) {
                            File file = File(value.pickedFile[i].path);

                            value.getFileType(value.pickedFile);
                            print("Pick file type is ${value.pickedFile[i].name}");
                            if(file.lengthSync()>maxSizeInBytes){
                              if(context.mounted) {
                                AwesomeDialog(
                                  btnOkColor: primary,
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'ဝမ်းနည်းပါတယ်',
                                desc: '10 MB ထက်ကျော်လွန်နေပါသည်',
                                //btnCancelText: "အိုကေ",
                                btnOkText: "အိုကေ",
                                btnOkOnPress: () {

                                },

                              ).show();
                              }
                            }else{

                              photoString =
                                  base64Encode(file.readAsBytesSync()).toString();
                              value.photos.add(photoString);
                            }

                          }

                          //value.photo=photoString;
                        },
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: const SizedBox(
                            width: 100,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      if (value.pickedFile != [])
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.pickedFile.length,
                            itemBuilder: (context, index) {
                              print("File Type is here ${value.fileType?[index]}");
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/noimage.jpeg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                              // :Image.file(
                              //   File(value.pickedFile[index].path),
                              //   width: 100,
                              //   height: 100,
                              //   fit: BoxFit.cover,
                              // )
                              ;
                            },
                          ),
                        ),

                      ///price
                      const SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ReusableText(
                              reuseText: "မှတ်ချက်",
                              fWeight: FontWeight.bold,
                            ),
                            ReusableTextField(
                              textEditingController: value.remark,
                              hintText: "မှတ်ချက်ထည့်ပါ",
                              keyboardType: TextInputType.text,
                              borderColor: kLoginBorderColor,
                              borderRadius: kLargeBorderRadius,
                            ),
                          ],
                        ),
                      ),
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
        ),
        bottomNavigationBar: Consumer<ProductSellingProvider>(
          builder: (context, value, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: IgnorePointer(
              ignoring: value.loading,
              child: ReusableButton(
                onTap: () {
                  if (value.price.text.isNotEmpty &&
                      value.address.text.isNotEmpty &&
                      value.phone.text.isNotEmpty) {
                    value.enableLoading();
                    Future.delayed(const Duration(seconds: 2), () {
                      print("Cat ID type is here${widget.catID}");
                      value.productSellingOrder(
                          widget.catID,
                          (widget.productID),
                          widget.productID == null ? value.riceType.text : "",
                          DateTime.now().toString().split(".")[0],
                          value.ricePercent.text.isNotEmpty
                              ? int.parse(value.ricePercent.text)
                              : null,
                          value.ricePercent.text.isNotEmpty
                              ? int.parse(value.brokenRicePercent.text)
                              : null,
                          (value.moisturePercent.text.isNotEmpty)
                              ? int.parse(value.moisturePercent.text)
                              : null,
                          "${value.weight.text}${widget.productTypeData?.measurements?[value.selectQty ?? 0].name}",
                          value.selectQty != null
                              ? (widget
                                      .productTypeData
                                      ?.measurements?[value.selectQty ?? 1]
                                      .id ??
                                  1)
                              : null,
                          int.parse(value.quantity.text),
                          int.parse(value.price.text),
                          value.address.text,
                          value.showPriceID,
                          value.photos,
                          value.remark.text,
                          value.phone.text,
                          context);
                    });
                  } else {
                    AwesomeDialog(
                      btnOkColor: primary,
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.rightSlide,
                      title: 'ဝမ်းနည်းပါတယ်',
                      desc: 'အချက်အလက်များစုံလင်စွာဖြည့်သွင်းပါ',
                      //btnCancelText: "အိုကေ",
                      btnOkText: "အိုကေ",
                      btnOkOnPress: () {
                        // Navigator.of(context).pushAndRemoveUntil(
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const SelectRiceTypeScreen()),
                        //         (Route<dynamic> route) => false);
                      },
                      // btnCancelOnPress: () {
                      //   // Navigator.of(context).pushAndRemoveUntil(
                      //   //     MaterialPageRoute(
                      //   //         builder: (context) => const HistoryScreen()),
                      //   //         (Route<dynamic> route) => false);
                      // }
                    ).show();
                  }
                },
                widget: value.loading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      )
                    : const ReusableText(
                        reuseText: "အရောင်းတင်မည်",
                        fColor: white,
                      ),
                width: MediaQuery.of(context).size.width,
                text: "",
                color: value.loading ? primary.withOpacity(0.5) : primary,
                textColor: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
