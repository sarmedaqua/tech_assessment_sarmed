

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/home_controller.dart';

class RevenueWidget extends StatelessWidget {
  final HomeController homeController = Get.find();

  List<BarChartGroupData> _buildBarGroups() {
    return homeController.bars
        .asMap()
        .map((i, value) => MapEntry(
      i,
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: value,
            color: Colors.white,
            width: 4,
          ),
        ],
      ),
    ))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '\$',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Revenue',
                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Obx(() {
                return TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: homeController.revenue.value),
                  duration: Duration(seconds: 7),
                  builder: (context, value, child) {
                    return Text(
                      '$value',
                      style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w500),
                    );
                  },
                );
              }),
              SizedBox(width: 10),
              Expanded(
                child: Obx(() {
                  return SizedBox(
                    height: 50,
                    child: BarChart(
                      BarChartData(
                        barGroups: _buildBarGroups(),
                        titlesData: FlTitlesData(
                          show: false,
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        gridData: FlGridData(show: false),
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            //tooltipBgColor: Colors.transparent,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                '',
                                TextStyle(color: Colors.transparent),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
