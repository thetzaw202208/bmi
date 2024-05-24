import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/provider/select_rice_type_provider.dart';
import 'package:bmi/screen/home/daily_prices.dart';
import 'package:bmi/screen/seller_process/seller_goods_type.dart';
import 'package:bmi/screen/seller_process/selling_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<SelectRiceTypeProvider>(
        builder: (context,value,child)=>value.isLoading?const Center(child:CircularProgressIndicator() ,): Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: value.onLoading,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    reuseText: "အချက်အလက် အသစ်ရယူနိုင်ရန်် နှိပ်ပါ  ",
                    fSize: 14,
                    fColor: Colors.blue,
                    fWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                  Icon(
                    Icons.refresh,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: ReusableText(
                  reuseText: "ရောင်းမည့် အမျိုးအစား ရွေးချယ်ပါ",
                  //fColor: white,
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
                    itemCount: value.productType?.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1
                ), itemBuilder: (context,index)=>GestureDetector(

                    onTap: (){
                      value.selectRiceType(index);
                    },
                    child: Container(
                      width: 100,
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: value.selectedIndex == index ? blueWithOpacity : black.withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
                            child: Image.network(
                              value.productType?[index].photo?.originalUrl??""

                            ),
                          ),
                          ReusableText(
                            reuseText: value.productType?[index].name,
                            fWeight: FontWeight.bold,
                            fSize: 14,

                            fColor:value.selectedIndex == index
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
      ),
      bottomNavigationBar:  Consumer<SelectRiceTypeProvider>(
        builder: (context,data,child)=> Padding(
          padding: const EdgeInsets.all(10.0),
          child: ReusableButton(
            onTap: (){

              if(data.selectedIndex!=null){
                if((data.productTypeByID?.products!.length)!>0){
                  data.unselectedRiceType();
                  print("Here is select ID ${data.productID}");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SellerGoodsType(type: data.productID??1)));
                }else{
                  data.unselectedRiceType();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(productTypeData: data.productTypeByID,
                      catID: data.productID??1,
                      productID: null,
                      productName: "အခြား")));
                }
                //data.getProductDataByID(data.productType?[data.selectedIndex??1].id??1);

              }
              else{
                if(context.mounted) {
                  AwesomeDialog(
                    btnOkColor: primary,
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
      ),
    );
  }
}
