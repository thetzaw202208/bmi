import 'package:bmi/data/static_data/selling_history_model.dart';
import 'package:bmi/screen/home/market_price.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../reusable_widgets/reusable_text.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  List<SellingHistoryModel> sellingHistory=[
    SellingHistoryModel("နှံကောက်(ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၄", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
    SellingHistoryModel("ဆင်းသုခ(ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၃", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
    SellingHistoryModel("ရက် ၉၀ (ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၁", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
    SellingHistoryModel("ကျားပျံ (ရှယ်)", "၁.၅ ", "၁၂", "ပေါင်", "၂", "၁၉၀၀၀၀", "လှိုင်", "+၉၅၉၉၈၇၆၅၄၃၂၁", "assets/images/12/1.jpg"),
  ];
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
          reuseText: "ရောင်းချမှု မှတ်တမ်း",
          fSize: 16,
          fWeight: FontWeight.bold,
          fColor: white,
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: sellingHistory.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                //     HistoryDetails(orderList:value.sellingHistory[index],orderType: index,)), (Route<dynamic> route) => true);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    // foregroundDecoration: RotatedCornerDecoration.withColor(
                    //   color: index == 0
                    //       ? yellow
                    //       : index == 1
                    //       ? green
                    //       : index == 2
                    //       ? Colors.blue
                    //       : Colors.red,
                    //   badgeSize: const Size(140, 60),
                    //   spanBaselineShift: 0,
                    //   spanHorizontalOffset: 5,
                    //   badgeCornerRadius: const Radius.circular(10),
                    //   textSpan: TextSpan(
                    //     text: index == 0
                    //         ? 'အော်ဒါတင်ပြီး'
                    //         : index == 1
                    //         ? "ပို့ဆောင်နေ"
                    //         : index == 2
                    //         ? "ပို့ဆောင်ပြီးစီး"
                    //         : "အော်ဒါပယ်ဖျက်",
                    //     style: const TextStyle(fontSize: 14),
                    //   ),
                    // ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(
                              reuseText: sellingHistory[index].type,
                              fWeight: FontWeight.bold,
                            ),
                            Text(
                                "${sellingHistory[index].price} ကျပ်"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("${sellingHistory[index].weight}${sellingHistory[index].weightType}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                "${sellingHistory[index].quantity} အိတ်"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             ReusableText(
                                reuseText:
                                sellingHistory[index].address),
                            ReusableText(
                                reuseText: DateTime.now()
                                    .toString()
                                    .split(" ")[0]),
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
        )

        );
  }
}
