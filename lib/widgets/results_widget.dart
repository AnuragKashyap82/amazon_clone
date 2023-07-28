import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../utils/utils.dart';

class ResultWidget extends StatelessWidget {
  final ProductModel productModel;

  const ResultWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(productModel: productModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: screenSize.width / 3,
                child: Image.network(productModel.url)),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                productModel.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  SizedBox(
                      width: screenSize.width / 5,
                      child: FittedBox(
                          child:
                              RatingStarWidget(rating: productModel.rating))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      productModel.noOfRating.toString(),
                      style: TextStyle(color: activeCyanColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: CostWidget(
                    color: Color.fromARGB(255, 92, 9, 3),
                    cost: productModel.cost),
              ),
            )
          ],
        ),
      ),
    );
  }
}
