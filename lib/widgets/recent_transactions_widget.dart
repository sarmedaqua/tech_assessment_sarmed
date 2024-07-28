import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../screens/transaction_list_screen.dart';

class RecentTransactionsWidget extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent transactions',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(TransactionListScreen());
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}
