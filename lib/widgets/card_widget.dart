import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class CardWidget extends StatelessWidget {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6B1B9A), Color(0xFF8E44AD)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Revolut',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (homeController.isCardFrozen.value)
                AnimatedOpacity(
                  opacity: homeController.isCardFrozen.value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.3),
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionButton(
              icon: Icons.remove_red_eye_sharp,
              label: 'Show details',
              backgroundColor: Color(0xFF8A2BE2),
              onTap: () {},
            ),
            OptionButton(
              icon: Icons.shield_sharp,
              label: 'Freeze card',
              backgroundColor: Color(0xFFFF6347),
              onTap: () {
                homeController.toggleFreezeCard();
              },
            ),
            OptionButton(
              icon: Icons.settings_rounded,
              label: 'Settings',
              backgroundColor: Color(0xFF1E90FF),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  const OptionButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[900], // Dark grey background
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: backgroundColor,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

