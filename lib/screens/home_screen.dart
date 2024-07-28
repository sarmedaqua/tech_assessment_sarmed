import '../widgets/card_widget.dart';
import '../widgets/recent_transactions_widget.dart';
import '../widgets/revenue_widget.dart';
import '/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Card"),
          content: Text("Add your card details here."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Cards',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _showAddCardDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(),
            const SizedBox(height: 20),
            RevenueWidget(),
            const SizedBox(height: 20),
            RecentTransactionsWidget(),
          ],
        ),
      ),
    );
  }
}
