import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/flashlight/flashlight_controller.dart';
import '../../features/flashlight/flashlight_widget.dart';
import '../../services/flashlight_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashlightController(FlashlightService()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              // Phần trên: La bàn và thời tiết
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    // TODO: Thêm widget La bàn
                    // TODO: Thêm widget Thời tiết
                  ],
                ),
              ),
              
              // Phần giữa: Đèn pin
              const Expanded(
                flex: 3,
                child: FlashlightWidget(),
              ),
              
              // Phần dưới: Quảng cáo
              Expanded(
                flex: 1,
                child: Container(
                  // TODO: Thêm banner quảng cáo
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 