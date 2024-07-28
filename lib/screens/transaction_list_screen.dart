import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class TransactionListScreen extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Transactions', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.transactions.length,
          itemBuilder: (context, index) {
            var transaction = homeController.transactions[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/${transaction['name']}.png',
                ),
              ),
              title: Text(
                transaction['name'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Money receive',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${transaction['amount']}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    transaction['status'] as String,
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
