import 'package:bmi/const/font_size_ext.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../const/img.dart';
import '../../data/network/response_vo/order_history_response_vo.dart';
import '../../reusable_widgets/reusable_text.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({
    super.key,
    required this.orderList,
  });
  final OrderData orderList;
  // final String address,phone,status;
  // final int statusID;
  @override
  Widget build(BuildContext context) {
    void showImagePreview(BuildContext context, String url) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Image.network(
              url, // Replace with your image URL
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: white),
        centerTitle: true,
        title: const ReusableText(
          reuseText: "ရောင်းချမှု မှတ်တမ်း အသေးစိတ်",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(
                  orderList.orderStatus == 1 ? pendingImg : successImg),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Material(
                elevation: 10,
                borderOnForeground: true,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: primary.withOpacity(0.6),
                        // borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReusableText(
                            reuseText: "အရေအတွက်",
                            fWeight: FontWeight.bold,
                            fColor: white,
                          ),
                          ReusableText(
                              reuseText: "အမျိုးအစား",
                              fWeight: FontWeight.bold,
                              fColor: white),
                          SizedBox(
                            width: 20,
                          ),
                          ReusableText(
                              reuseText: "စျေးနှုန်း",
                              fWeight: FontWeight.bold,
                              fColor: white),
                          // SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          ReusableText(
                            align: TextAlign.start,
                            fSize: 12,
                            reuseText: "${orderList.totalAmount}အိတ်  ",
                          ),
                          ReusableText(
                            align: TextAlign.start,
                            fSize: 12,
                            reuseText: "${orderList.productType} / ${orderList.productCategory} ",
                          ),
                          ReusableText(
                            align: TextAlign.start,
                            fSize: 12,
                            reuseText: "${orderList.price} ကျပ်  ",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const DottedLine(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(fSize:context.calculateLabelFontSize(),
                            reuseText: "ရောင်းချသူ အမည်",
                            fWeight: FontWeight.bold,
                          ),
                          ReusableText(fSize:context.calculateLabelFontSize(),reuseText: orderList.sellerName),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(
                             fSize:context.calculateLabelFontSize(),
                            reuseText: "နေ့စွဲ",
                            fWeight: FontWeight.bold,
                          ),
                          ReusableText(fSize:context.calculateLabelFontSize(),reuseText: orderList.orderDate),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   if(orderList.categoryPriceName!=null) Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(
                             fSize: context.calculateLabelFontSize(),
                            reuseText: "စျေးအမျိုးအစား",
                            fWeight: FontWeight.bold,
                          ),
                          SizedBox(
                              width: 150,
                              child: Text( textAlign: TextAlign.right,"${orderList.categoryPriceName}",style: TextStyle(fontSize:context.calculateLabelFontSize()))),
                        ],
                      ),
                    ),
                    if(orderList.categoryPriceName!=null)const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(
                            reuseText: "အော်ဒါ အခြေအနေ",
                            fSize: context.calculateLabelFontSize(),
                            fWeight: FontWeight.bold,
                          ),
                          ReusableText(reuseText: orderList.statusName,fSize: context.calculateLabelFontSize(),),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(
                             width:120,
                             child: Text(
                               "ရောင်းချသူ၏ လိပ်စာ အသေးစိတ်",
                             style: TextStyle(
                               fontSize: context.calculateLabelFontSize(),
                               fontWeight: FontWeight.bold,
                             ),
                                                       ),
                           ),
                          SizedBox(
                              width: 200,
                              //height: 200,
                              child: Text( orderList.address??"",textAlign: TextAlign.right,style: TextStyle(
                                 fontSize:  context.calculateLabelFontSize()
                              ),)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:120,
                            child: Text(
                              "ဖုန်းနံပါတ်",
                              style: TextStyle(
                                fontSize: context.calculateLabelFontSize(),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 200,
                              //height: 200,
                              child: Text( orderList.phoneNo??"",textAlign: TextAlign.right,style: TextStyle(
                                  fontSize:  context.calculateLabelFontSize()
                              ),)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  if(orderList.remark!=null)  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(
                            reuseText: "မှတ်ချက်",
                            fSize: context.calculateLabelFontSize(),
                            fWeight: FontWeight.bold,
                          ),
                          SizedBox(
                              width: 200,
                              //height: 200,
                              child: Text( orderList.remark??"",textAlign: TextAlign.right,)),
                        ],
                      ),
                    ),
                    if(orderList.remark!=null) const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           ReusableText(fSize:context.calculateLabelFontSize(),
                            reuseText: "ဓာတ်ပုံဖိုင်",
                            fWeight: FontWeight.bold,
                          ),
                          InkWell(
                              onTap: () {
                                showImagePreview(
                                    context, "${orderList.photo?.originalUrl}");
                              },
                              child: Image.network(
                                orderList.photo?.originalUrl ?? "",
                                width: 70,
                                height: 70,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ReusableText(
                      reuseText:
                          "* မြင်ကွင်းကျယ်ပုံကြည့်လိုပါက ပုံကိုတချက်ထိ၍ကြည့်နိုင်ပါသည်",
                      fSize: 12,
                      fColor: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
