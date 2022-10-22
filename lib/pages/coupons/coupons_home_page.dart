import 'package:flutter/material.dart';
import 'package:takecare_user/pages/coupons/coupons_current_page.dart';
import 'package:takecare_user/pages/coupons/coupons_past_page.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';

class CouponsHomePage extends StatefulWidget {
  const CouponsHomePage({Key? key}) : super(key: key);

  @override
  State<CouponsHomePage> createState() => _CouponsHomePageState();
}

class _CouponsHomePageState extends State<CouponsHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Coupons",
            style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                color: AllColor.pink_button),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Current"),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Past"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CouponsCurrentPage(),
            CouponsPastPage(),
          ],
        ),
      ),
    );
  }

}
