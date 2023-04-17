import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double smallAdHeight = screenSize.width/5;

    return GestureDetector(
      onHorizontalDragEnd: (_){
        setState(() {
          if(currentAd == largeAds.length -1){
            currentAd = -1;
          }
          setState(() {
            currentAd++;
          });
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screenSize.width,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      backgroundColor, backgroundColor.withOpacity(0)
                    ])
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


