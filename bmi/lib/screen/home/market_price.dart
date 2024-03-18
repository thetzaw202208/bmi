
import 'package:bmi/screen/seller_process/select_rice_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:intl/intl.dart';
import '../../const/color.dart';
import '../../reusable_widgets/custom_drawer.dart';
import '../../reusable_widgets/reusable_button.dart';
import '../../reusable_widgets/reusable_text.dart';
import '../history/history.dart';

class MarketPriceScreen extends StatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  State<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen> {
  String dateShow=DateTime.now().toString().split(" ")[0];
  String dayName="";

  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateShow=_selectedDate.toString().split(" ")[0];
         dayName = _selectedDate == null
            ? 'No date selected'
            : DateFormat('EEEE').format(_selectedDate!);
      });
    }
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(

      scaffoldChild:
       Scaffold(

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
              GestureDetector(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HistoryScreen()));

              }, child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // ReusableText(reuseText: "ဝယ်ယူမှု မှတ်တမ်း",fWeight: FontWeight.bold,),
                  Icon(Icons.history,size: 30,),
                ],
              )),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ReusableText(
                    reuseText: "နေ့အလိုက် ပေါက်စျေးကြည့်ရန်",
                    fWeight: FontWeight.w400,
                    fSize: 14,
                  ),
                  Chip(
                    label: ReusableText(reuseText: dateShow,),
                    deleteIcon: const Icon(Icons.arrow_drop_down_circle),
                    onDeleted: (){
                      _selectDate(context);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ReusableText(reuseText: "ယနေ့ $dateShow  $dayName ကုန်စည် ပေါက်စျေးနှုန်းများ",fSize: 13,),
              const SizedBox(
                height: 20,
              ),
              Table(

                columnWidths: const {
                  0: FlexColumnWidth(5),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(3),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                        gradient: kPrimaryLn,

                          border: Border.all(color: white,width: 2)
                      ),
                      children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "အမည်",
                          fWeight: FontWeight.bold,
                          fSize: 14,
                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "ရေတွက်ပုံ",
                        fWeight: FontWeight.bold,
                        fSize: 14,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "စျေးနှုန်း",
                        fWeight: FontWeight.bold,
                        fSize: 14,
                      ),
                    ),
                  ]),
                  TableRow(
                      decoration: BoxDecoration(
                        color: black.withOpacity(0.1),

                          border: Border.all(color: white,width: 2)
                      ),
                      children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ဧည့်မထဆန် (မနောသုခ)",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၈၂,၀၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                  TableRow( decoration: BoxDecoration(
                    color: black.withOpacity(0.1),

                      border: Border.all(color: white,width: 2)
                  ),children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ပေါ်ဆန်းမွှေး (သစ်)",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁၁၀,၀၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                  TableRow( decoration: BoxDecoration(
                    color: black.withOpacity(0.1),

                      border: Border.all(color: white,width: 2)
                  ),children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ပေါ်ဆန်းမွှေး (ဟောင်း)",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁၃၀,၀၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                  TableRow( decoration: BoxDecoration(
                    color: black.withOpacity(0.1),

                      border: Border.all(color: white,width: 2)
                  ),children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ဆန်ကွဲ (1,2)",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၅၄,၀၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                  TableRow( decoration: BoxDecoration(
                    color: black.withOpacity(0.1),

                      border: Border.all(color: white,width: 2)
                  ),children: const [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ဆန်ကွဲ (3,4)",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၅၂,၀၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                  TableRow( decoration: BoxDecoration(
                    color: black.withOpacity(0.1),
      border: Border.all(color: white,width: 2)
                  ),children: const [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ReusableText(
                          reuseText: "ဖွဲနု",
                          fWeight: FontWeight.normal,
                          fSize: 12,

                        ),
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁ အိတ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                    TableCell(
                      child: ReusableText(
                        reuseText: "၁၅,၉၀၀ ကျပ်",
                        fWeight: FontWeight.normal,
                        fSize: 12,
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
         bottomNavigationBar:  Padding(
           padding: const EdgeInsets.all(10.0),
           child: ReusableButton(
             onTap: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectRiceTypeScreen()));


             },
             width: MediaQuery.of(context)
                 .size
                 .width,
             text: "ရောင်းချမည်",color: primary,textColor: white,),
         ),
      ),
    );
  }
}
