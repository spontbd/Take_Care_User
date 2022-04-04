import 'package:flutter/material.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/pages/order_history/current_page.dart';
import 'package:takecare_user/pages/order_history/past_page.dart';

import '../../public_variables/all_colors.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Order History",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(
                  MaterialPageRoute(
                      builder: (_) =>
                          HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
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

            CurrentPage(),
           PastPage(),
          ],
        ),
      ),
    );
  }
}
