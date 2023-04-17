import 'package:amazon_clone/resources/cloudFirestoreMethods.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/cate_hori_list_view_bar.dart';
import 'package:amazon_clone/widgets/products_showcase_list.dart';
import 'package:amazon_clone/widgets/search_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
    await CloudFireStoreClass().getProductsFromDiscount(70);
    List<Widget> temp60 =
    await CloudFireStoreClass().getProductsFromDiscount(60);
    List<Widget> temp50 =
    await CloudFireStoreClass().getProductsFromDiscount(50);
    List<Widget> temp0 = await CloudFireStoreClass().getProductsFromDiscount(0);
    print("everything is done");
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackBtn: false,
      ),
      body: discount70 != null &&
          discount60 != null &&
          discount50 != null &&
          discount0 != null
          ? Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                CategoriesHorizontalListViewBar(),
                BannerAdWidget(),
                ProductShowCaseListView(
                    title: "Upto 70% Off", children: discount70!),
                ProductShowCaseListView(
                    title: "Upto 60% Off", children: discount60!),
                ProductShowCaseListView(
                    title: "Upto 50% Off", children: discount50!),
                ProductShowCaseListView(
                    title: "Explore", children: discount0!),
              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
          ),
        ],
      )
          : const LoadingWidget(),
    );
  }
}