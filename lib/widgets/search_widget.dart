import 'package:amazon_clone/screens/result_screen.dart';
import 'package:amazon_clone/screens/search_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackBtn;

  SearchBarWidget(
      {Key? key, required this.isReadOnly, required this.hasBackBtn})
      : preferredSize = Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackBtn
              ? IconButton(onPressed: () {
                Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back))
              : Container(),
          SizedBox(
            width: screenSize.width * 0.7,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, spreadRadius: 1, offset: const Offset(0,5))]
              ),
              child: TextField(
                onSubmitted: (String query){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsScreen(query: query)));
                },
                readOnly: isReadOnly,
                onTap: (){
                  if(isReadOnly){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: border,
                    focusedBorder: border,
                    hintText: "Search for Something in amazon"
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.mic_none_outlined))
        ],
      ),
    );
  }
}
