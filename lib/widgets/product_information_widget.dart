import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;

  const ProductInformationWidget(
      {Key? key,
      required this.productName,
      required this.cost,
      required this.sellerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizedBox spaceThing = SizedBox(height: 7,);
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0.8,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          spaceThing,
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: CostWidget(color: Colors.black, cost: cost),
              )),
          spaceThing,
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "sold by: ", style: TextStyle(color: Colors.grey[700])),
              TextSpan(text: sellerName, style: TextStyle(color: activeCyanColor))
            ])),
          )
        ],
      ),
    );
  }
}
