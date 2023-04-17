import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductShowCaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductShowCaseListView({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height/4;
    double titleHeight = 25;
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
                Text(title, style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
                ),),
                const Padding(
                  padding: EdgeInsets.only(left: 14),
                  child:  Text("Show More", style: TextStyle(color: activeCyanColor),),
                )
              ],
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
