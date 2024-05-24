import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi/provider/select_rice_type_provider.dart';
import 'package:bmi/screen/seller_process/selling_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    print("Here is product cat ID ${widget.type}");
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
      body: Consumer<SelectRiceTypeProvider>(
        builder: (context, value, _) => Padding(
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
              const ReusableText(
                reuseText: "*စာရင်းတွင် မပါဝင်ပါက အခြားကို ရွေးချယ်ပါ ",
                fColor: Colors.red,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: value.productTypeByID?.products?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 4,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          productTypeData:
                                              value.productTypeByID,
                                          productName: value.productTypeByID
                                                  ?.products?[index].name ??
                                              "",
                                          productID: value.productTypeByID
                                                  ?.products?[index].id ??
                                              1,
                                          catID: value
                                                  .productTypeByID
                                                  ?.products?[index]
                                                  .productCategoryId ??
                                              1,
                                        )));
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                                // padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 90,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: ReusableText(
                                    reuseText: value
                                        .productTypeByID?.products?[index].name,
                                    fSize: 12,
                                    fColor: black,
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
      ),
      bottomNavigationBar: Consumer<SelectRiceTypeProvider>(
        builder: (context, data, _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: ReusableButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          productTypeData: data.productTypeByID,
                          catID: widget.type,
                          productID: null,
                          productName: "အခြား")));
            },
            width: MediaQuery.of(context).size.width,
            text: "အခြား",
            color: primary,
            textColor: white,
          ),
        ),
      ),
    );
  }
}
