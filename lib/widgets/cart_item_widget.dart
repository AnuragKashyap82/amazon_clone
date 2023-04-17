import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/resources/cloudFirestoreMethods.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

import '../screens/product_screen.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const CartItemWidget({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(productModel: productModel)
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 3,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Image.network(productModel.url),
                          )),
                    ),
                    ProductInformationWidget(
                        productName: productModel.productName,
                        cost: productModel.cost,
                        sellerName: productModel.sellerName)
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  CustomSquareButton(
                      child: Icon(Icons.remove),
                      onPressed: () {},
                      color: backgroundColor,
                      dimensions: 40),
                  CustomSquareButton(
                      child: Text(
                        "1",
                        style: TextStyle(color: activeCyanColor),
                      ),
                      onPressed: () {},
                      color: Colors.white,
                      dimensions: 40),
                  CustomSquareButton(
                      child: Icon(Icons.add),
                      onPressed: () async {
                        await CloudFireStoreClass().addProductToCart(
                            productModel: ProductModel(
                                url: productModel.url,
                                productName: productModel.productName,
                                cost: productModel.cost,
                                discount: productModel.discount,
                                uid: Utils().getUid(),
                                sellerName: productModel.sellerName,
                                sellerUid: productModel.sellerUid,
                                rating: productModel.rating,
                                noOfRating: productModel.noOfRating));
                      },
                      color: backgroundColor,
                      dimensions: 40)
                ],
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomSimpleRoundedBotton(
                            onPressed: () async {
                              CloudFireStoreClass().deleteProductFromCart(uid: productModel.uid);
                            }, text: "Delete"),
                        SizedBox(
                          width: 5,
                        ),
                        CustomSimpleRoundedBotton(
                            onPressed: () {}, text: "Save for later"),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "see more like this",
                            style: TextStyle(color: activeCyanColor),
                          )),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
