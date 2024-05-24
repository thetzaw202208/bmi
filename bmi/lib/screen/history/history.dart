import 'package:bmi/data/static_data/selling_history_model.dart';
import 'package:bmi/provider/order_history_provider.dart';
import 'package:bmi/screen/home/daily_prices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import '../../const/color.dart';
import '../../reusable_widgets/reusable_text.dart';
import 'history_details.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // List<SellingHistoryModel> sellingHistory=[
  //   SellingHistoryModel("နှံကောက်(ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၄", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
  //   SellingHistoryModel("ဆင်းသုခ(ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၃", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
  //   SellingHistoryModel("ရက် ၉၀ (ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၁", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
  //   SellingHistoryModel("ကျားပျံ (ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၂", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
  // ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderHistoryProvider>(
      create: (context) => OrderHistoryProvider(),
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const MarketPriceScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
            backgroundColor: primary,
            iconTheme: const IconThemeData(color: white),
            centerTitle: true,
            title: const ReusableText(
              reuseText: "ရောင်းချမှု မှတ်တမ်း",
              fSize: 16,
              fWeight: FontWeight.bold,
              fColor: white,
            ),
          ),
          body: Consumer<OrderHistoryProvider>(
            builder: (context, historyData, _) => historyData.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (historyData.orderHistoryList?.isNotEmpty == true)
                    ? Column(
                      children: [
                        const SizedBox(height: 10,),
                        const ReusableText(reuseText: "* မြင်ကွင်းကျယ်ပုံကြည့်လိုပါက ပုံကိုတချက်ထိ၍ကြည့်နိုင်ပါသည်",fSize: 12,fColor: Colors.red,),
                        const SizedBox(height: 10,),
                        Expanded(

                            child: ListView.builder(
                              itemCount: historyData.orderHistoryList?.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                      HistoryDetails(orderList:historyData.orderHistoryList![index],)), (Route<dynamic> route) => true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 130,
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   color:
                                      //       historyData.orderHistoryList?[index].orderStatus==1
                                      //           ? white
                                      //           : Colors.blue.withOpacity(0.2),
                                      // ),

                                      foregroundDecoration: RotatedCornerDecoration.withColor(
                                        color: historyData.orderHistoryList?[index].orderStatus==1
                                            ? Colors.orange
                                            : Colors.blue,
                                        badgeSize: const Size(120, 40),
                                        spanBaselineShift: 5,
                                        spanHorizontalOffset: 5,
                                        badgeCornerRadius: const Radius.circular(10),
                                        textSpan: TextSpan(
                                          text:historyData.orderHistoryList?[index].statusName,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [

                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  historyData.showImagePreview(context, "${historyData.orderHistoryList?[index].photo?.originalUrl}");
                                                },
                                                child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: Image.network("${historyData.orderHistoryList?[index].photo?.originalUrl}")),
                                              ),
                                              const SizedBox(width: 10,),
                                              ReusableText(
                                                reuseText: "${historyData.orderHistoryList?[index].productType} / ${historyData.orderHistoryList?[index].productCategory}",
                                                fWeight: FontWeight.bold,
                                              ),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      "${historyData.orderHistoryList?[index].weight}"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      "${historyData.orderHistoryList?[index].price} ကျပ်"),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  const Text(
                                                      "x"),
                                                  ReusableText(reuseText:
                                                      "${historyData.orderHistoryList?[index].totalAmount}",fWeight: FontWeight.w500,fSize: 16,),
                                                  const ReusableText(reuseText:
                                                  " အိတ်",fWeight: FontWeight.w500,fSize: 12,),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: ReusableText(
                                                    reuseText: historyData
                                                        .orderHistoryList?[index]
                                                        .address,overflow: TextOverflow.ellipsis,),
                                              ),
                                              ReusableText(
                                                  reuseText: historyData.orderHistoryList?[index].orderDate),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(10.0),
                              //   child: Material(
                              //     elevation: 5,
                              //     borderRadius: BorderRadius.circular(10),
                              //     child: ListTile(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(10)),
                              //       leading: Material(
                              //         elevation: 5,
                              //         borderRadius: BorderRadius.circular(100),
                              //         child: Container(
                              //           width: 40,
                              //           height: 40,
                              //           decoration: BoxDecoration(
                              //               shape: BoxShape.circle, color: Colors.red),
                              //           child: IconButton(
                              //               onPressed: () {
                              //                 _showBottomSheet(context,index);
                              //               },
                              //               icon: ReusableText(
                              //                   reuseText:
                              //                       value.orderList[index].orderCount.toString(),fColor: white,)),
                              //         ),
                              //       ),
                              //       title: ReusableText(
                              //           reuseText: value.orderList[index].riceType),
                              //       subtitle: ReusableText(
                              //           reuseText: value.orderList[index].quantity),
                              //       trailing: ReusableText(
                              //           reuseText:
                              //               "${value.orderList[index].totalAmount} ကျပ်"),
                              //     ),
                              //   ),
                              // )
                            ),
                          ),
                      ],
                    )
                    : const Center(
                        child: ReusableText(reuseText: "အချက်အလက် မရှိပါ"),
                      ),
          )),
    );
  }
}
