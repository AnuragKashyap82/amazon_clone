import 'dart:developer';

import 'package:amazon_clone/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Product gets ");
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(productModel: productModel)));
      },
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}
