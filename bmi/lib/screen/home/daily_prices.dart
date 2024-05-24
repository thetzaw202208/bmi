import 'package:bmi/const/font_size_ext.dart';
import 'package:bmi/const/img.dart';
import 'package:bmi/provider/daily_prices_provider.dart';
import 'package:bmi/screen/seller_process/select_rice_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../const/color.dart';
import '../../const/dimen.dart';
import '../../reusable_widgets/custom_drawer.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../../reusable_widgets/reusable_textField.dart';
import '../history/history.dart';

class MarketPriceScreen extends StatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  State<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen> {
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DailyPricesProvider>(
      create: (context) => DailyPricesProvider(),
      child: CustomDrawer(
        scaffoldChild: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: _handleMenuButtonPressed,
              child: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/BMi_LOGO-01.png",
                  width: 150,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // ReusableText(reuseText: "ဝယ်ယူမှု မှတ်တမ်း",fWeight: FontWeight.bold,),
                        Icon(
                          Icons.history,
                          size: 30,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          body: Consumer<DailyPricesProvider>(
            builder: (context, responseData, _) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Opacity(
                          opacity: 0.5,
                          child: ReusableText(
                            reuseText: "ယနေ့ ရန်ကုန် ပေါက်စျေးများ",
                            fWeight: FontWeight.w400,
                            fSize: 12,
                          ),
                        ),
                        Chip(
                          backgroundColor: Colors.blue.withOpacity(0.5),
                          elevation: 10,
                          side: BorderSide.none,
                          label: ReusableText(
                            reuseText: responseData.dateShow,
                            fColor: white,
                          ),
                          deleteIcon: const Icon(Icons.arrow_drop_down_circle_outlined,color: white,),
                          onDeleted: () {
                            responseData.selectDate(context);
                          },
                        )
                      ],
                    ),

                   // const Divider(),
                    // ReusableText(
                    //   reuseText:
                    //       "${responseData.dateShow}  ${responseData.dayName} ကုန်စည် ပေါက်စျေးနှုန်းများ",
                    //   fSize: 13,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    // if (responseData.pricesData?.isNotEmpty == true)
                    //   Align(
                    //     alignment: Alignment.centerRight,
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         responseData.showHideRemark();
                    //       },
                    //       child: Container(
                    //           //height: 50,
                    //           decoration: BoxDecoration(
                    //               //border: Border.all(color: Colors.black),
                    //               borderRadius: BorderRadius.circular(5)),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: ReusableText(
                    //               reuseText: (!responseData.showRemark)
                    //                   ? "မှတ်ချက်ကြည့်ရန်"
                    //                   : "မူလသို့",
                    //               fSize: 11,
                    //               fColor: Colors.blue,
                    //             ),
                    //           )),
                    //     ),
                    //   ),
                    // (responseData.pricesData?.isNotEmpty == true)
                    //     ? Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 0.0, vertical: 10),
                    //         child: Material(
                    //           elevation: 10,
                    //           borderOnForeground: true,
                    //           borderRadius: BorderRadius.circular(10),
                    //           child: Column(
                    //             mainAxisSize: MainAxisSize.max,
                    //             children: [
                    //               Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 10),
                    //                 height: 50,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.blue.withOpacity(0.4),
                    //                   // borderRadius: BorderRadius.circular(10)
                    //                 ),
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceBetween,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   children: [
                    //                     const ReusableText(
                    //                       reuseText: "အမျိုးစား",
                    //                       fWeight: FontWeight.bold,
                    //                       fColor: white,
                    //                       fSize: 12,
                    //                     ),
                    //                     const ReusableText(
                    //                       reuseText: "ဝယ်စျေး", fColor: white,
                    //                       fWeight: FontWeight.bold,
                    //                       fSize: 12,
                    //                     ),
                    //                     const ReusableText(
                    //                       reuseText: "ရောင်းစျေး", fColor: white,
                    //                       fWeight: FontWeight.bold,
                    //                       fSize: 12,
                    //                     ),
                    //                     if (!responseData.showRemark)
                    //                       const ReusableText(
                    //                         reuseText: "ဆန်သား", fColor: white,
                    //                         fWeight: FontWeight.bold,
                    //                         fSize: 12,
                    //                       ),
                    //                     if (responseData.showRemark)
                    //                       const ReusableText(
                    //                         reuseText: "မှတ်ချက်", fColor: white,
                    //                         fWeight: FontWeight.bold,
                    //                         fSize: 12,
                    //                       ),
                    //                   ],
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 height: 20,
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 15.0),
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceBetween,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   //mainAxisSize: MainAxisSize.min,
                    //                   children: [
                    //                     SizedBox(
                    //                       height: 100,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           .2,
                    //                       child: ListView.builder(
                    //                         physics:
                    //                             const NeverScrollableScrollPhysics(),
                    //                         itemCount:
                    //                             responseData.pricesData?.length,
                    //                         itemBuilder: (context, index) =>
                    //                             Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 4.0),
                    //                           child: ReusableText(
                    //                             align: TextAlign.start,
                    //                             fSize: context.calculateFontSize(),
                    //                             reuseText:
                    //                                 "${responseData.pricesData?[index].type}",
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 100,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           .1,
                    //                       child: ListView.builder(
                    //                         physics:
                    //                             const NeverScrollableScrollPhysics(),
                    //                         itemCount:
                    //                             responseData.pricesData?.length,
                    //                         itemBuilder: (context, index) =>
                    //                             Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 4.0),
                    //                           child: ReusableText(
                    //                             align: TextAlign.start,
                    //                             fSize: context.calculateFontSize(),
                    //                             reuseText:
                    //                                 "${responseData.pricesData?[index].buyPrice}",
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 100,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           .1,
                    //                       child: ListView.builder(
                    //                         physics:
                    //                             const NeverScrollableScrollPhysics(),
                    //                         itemCount:
                    //                             responseData.pricesData?.length,
                    //                         itemBuilder: (context, index) =>
                    //                             Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 4.0),
                    //                           child: ReusableText(
                    //                             fSize: context.calculateFontSize(),
                    //                             reuseText:
                    //                                 "${responseData.pricesData?[index].sellPrice}",
                    //                             align: TextAlign.end,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     if (!responseData.showRemark)
                    //                       SizedBox(
                    //                         height: 100,
                    //                         width: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             .15,
                    //                         child: ListView.builder(
                    //                           physics:
                    //                               const NeverScrollableScrollPhysics(),
                    //                           itemCount: responseData
                    //                               .pricesData?.length,
                    //                           itemBuilder: (context, index) =>
                    //                               Padding(
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                     vertical: 4.0),
                    //                             child: ReusableText(
                    //                               fSize: context.calculateFontSize(),
                    //                               reuseText:
                    //                                   "${responseData.pricesData?[index].rice}",
                    //                               align: TextAlign.end,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     if (responseData.showRemark)
                    //                       SizedBox(
                    //                         height: 100,
                    //                         width: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             .2,
                    //                         child: ListView.builder(
                    //                           physics:
                    //                               const NeverScrollableScrollPhysics(),
                    //                           itemCount: responseData
                    //                               .pricesData?.length,
                    //                           itemBuilder: (context, index) =>
                    //                               Padding(
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                                     vertical: 4.0),
                    //                             child: ReusableText(
                    //                               fSize: context.calculateFontSize(),
                    //                               reuseText:
                    //                                   "${responseData.pricesData?[index].remark}",
                    //                               align: TextAlign.end,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       )
                    //                   ],
                    //                 ),
                    //               ),
                    //               const SizedBox(
                    //                 height: 20,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     : const Center(
                    //         child: ReusableText(
                    //           reuseText: "ရွေးချယ်ထားသောရက်အတွက် ဒေတာ မရှိပါ",
                    //           fColor: Colors.red,
                    //         ),
                    //       ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                     (responseData.remarkDate.isNotEmpty)?
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.withOpacity(0.5)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/BMi_LOGO-01.png",
                                  width: 100,
                                  height: 50,
                                ),
                                ReusableText(
                                  reuseText: responseData.remarkDate,
                                  fWeight: FontWeight.bold,
                                  fColor: white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                        : const Center(
                            child: ReusableText(
                              reuseText: "ရွေးချယ်ထားသောရက်အတွက် ဒေတာ မရှိပါ",
                              fColor: Colors.red,
                            ),
                          ),

                     (responseData.remark.isNotEmpty == true) ? Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: white,
                             ),
                          child: Opacity(
                              opacity: 0.8,
                              child: Text(
                                responseData.remark,
                                style: TextStyle(
                                  wordSpacing: 10,
                                ),
                              ))),
                    ) : const Center(
                       child: ReusableText(
                         reuseText: "",
                         fColor: Colors.red,
                       ),
                     ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ReusableButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectRiceTypeScreen()));
              },
              width: MediaQuery.of(context).size.width,
              text: "ရောင်းချမည်",
              color: primary,
              textColor: white,
            ),
          ),
        ),
      ),
    );
  }
}
