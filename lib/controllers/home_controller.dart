import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var revenue = 0.obs;
  var bars = <double>[].obs;
  var transactions = [
    {'name': 'HugeArts', 'amount': 739.65, 'status': 'Completed'},
    {'name': 'Peter Filatov', 'amount': 943.65, 'status': 'Completed'},

    // Add more transactions as needed
  ].obs;

  var isCardFrozen = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateRevenueAndBars();
    });
  }

  void updateRevenueAndBars() {
    revenue.value = 42220;
    bars.value = [0.5,1.5,2,2,2,2,2,2,2,2,2,2,2,2,2, 2, 3.5, 5, 2, 3.5, 5,2, 3.5, 5,6.5, 8, 9.5];
  }

  void toggleFreezeCard() {
    isCardFrozen.value = !isCardFrozen.value;
  }
}
